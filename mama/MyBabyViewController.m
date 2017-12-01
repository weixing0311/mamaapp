//
//  MyBabyViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/5.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "MyBabyViewController.h"

@interface MyBabyViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *headImageView;
@property (weak, nonatomic) IBOutlet UITextField *nicknametF;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTf;
@property (weak, nonatomic) IBOutlet UIButton *sexBtn;
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (strong, nonatomic) UIDatePicker *pickView;
@property (strong, nonatomic) NSMutableDictionary *params;

@end

@implementation MyBabyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"我的宝贝";
    self.params = [NSMutableDictionary dictionary];
    [self.cardView setShardow];
    [self setpickView];
    // Do any additional setup after loading the view from its nib.
}
-(void)setUpInfo
{
    [self.params safeSetObject:@"" forKey:@""];
    
    [[BaseSerVice sharedManager]post:@"" paramters:self.params success:^(NSDictionary *dic) {
        
    } failure:^(NSError *error) {
        
    }];
    
}
-(void)setpickView
{
    self.pickView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 200)];
    
    self.pickView.datePickerMode = UIDatePickerModeDate;
    NSDate * maxDate = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * mindateStr = @"1900-01-01 00:00:00";
    NSDate * minDate = [formatter dateFromString:mindateStr];
    
    NSString * defaultDateStr = @"1990-01-01 00:00:00";
    NSDate * defaultDate = [formatter dateFromString:defaultDateStr];
    
    self.pickView.minimumDate = minDate;
    self.pickView.maximumDate = maxDate;
    
    //    if (self.changeType==1||self.changeType ==3) {
    self.pickView.date = defaultDate;
    
    //    }else{
    //        self.pickView.date =   [[SubUserItem shareInstance].birthday dateyyyymmddhhmmss];
    //
    //    }
    
    
    
    [self.pickView addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
    
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0, 375, 49)];
    UIBarButtonItem * barFit1 =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    UIBarButtonItem * barFit2 =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]
                            initWithTitle:@"完成"style:UIBarButtonItemStylePlain target:self action:@selector(didhiddenPickView)];
    //    4.加一个固定的长度作为弹簧效果
    //    5.将设置的按钮加到toolBar上
    NSArray
    * buttonsArray = [NSArray arrayWithObjects:barFit1,bar,barFit2,nil];
    [toolBar setItems:buttonsArray];
    //    6.将toolBar加到text的输入框也就是UiDatePicker上
    self.birthdayTf.inputAccessoryView =toolBar;
    self.birthdayTf.inputView = self.pickView;
    self.birthdayTf.delegate = self;
    self.birthdayTf.userInteractionEnabled = YES;

}
-(void)didhiddenPickView
{
    [self.birthdayTf resignFirstResponder];
}
-(void)dateChanged:(UIDatePicker *)pick
{
    UIDatePicker* control = (UIDatePicker*)pick;
    NSDate* _date = control.date;
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    
    [formater setDateFormat:@"yyyy-MM-dd"];//设置时间显示的格式，此处使用的formater格式要与字符串格式完全一致，否则转换失败
    
    NSString *dateStr = [formater stringFromDate:_date];//将日期转换成字符串
    self.birthdayTf.text = dateStr;
}
- (IBAction)addHeadImage:(id)sender {
    
    UIAlertController *al = [UIAlertController alertControllerWithTitle:nil message:@"修改头像" preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    
    
    [al addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
        picker.delegate = self;
        picker.allowsEditing = YES;//设置可编辑
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
        
    }]];
    
    
    [al addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
            
        }
        pickerImage.delegate = self;
        pickerImage.allowsEditing = YES;
        [self presentViewController:pickerImage animated:YES completion:nil];
        
    }]];
    [al addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:al animated:YES completion:nil];

}
- (IBAction)didChangeSex:(id)sender {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"" message:@"请选择性别" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.params safeSetObject:@"1" forKey:@"sex"];
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.params safeSetObject:@"2" forKey:@"sex"];
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];

}
- (IBAction)didAddHeadImage:(id)sender {
    
    [self didAddHeadImage:nil];
    
}
- (IBAction)didUpdate:(id)sender {
    [self setUpInfo];
}




#pragma mark ----imagepickerdelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    //判断资源类型
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        //如果是图片
        UIImage *image =info[UIImagePickerControllerEditedImage];
        [image scaledToSize:CGSizeMake(JFA_SCREEN_WIDTH, JFA_SCREEN_WIDTH/image.size.width*image.size.height)];
        [self.headImageView setImage:image forState:UIControlStateNormal];

        [self dismissViewControllerAnimated:YES completion:nil];
        
        if (picker.sourceType ==UIImagePickerControllerSourceTypeCamera) {
            NSData *  fileDate = UIImageJPEGRepresentation(image, 0.001);
        }else{
            NSData *  fileDate = UIImageJPEGRepresentation(image, 0.01);

        }
        
    }
}//点击cancel 调用的方法

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
