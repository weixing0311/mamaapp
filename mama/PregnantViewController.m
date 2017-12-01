//
//  PregnantViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/11.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "PregnantViewController.h"
#import "MainViewController.h"
@interface PregnantViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *title1lb;
@property (weak, nonatomic) IBOutlet UITextField *value1tf;

@property (weak, nonatomic) IBOutlet UITextField *value2tf;
@property (weak, nonatomic) IBOutlet UITextField *value3tf;
@property (weak, nonatomic) IBOutlet UITextField *value4tf;
@property (weak, nonatomic) IBOutlet UITextField *value5tf;
@property (weak, nonatomic) IBOutlet UIView *textCardView;
@property (strong, nonatomic) UIDatePicker *pickView;


@property (nonatomic,assign) int isKonwYuChanDate;//是否知道预产期


@end

@implementation PregnantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"孕前资料";
    [self.textCardView setShardow];
    [self setpickView];
    // Do any additional setup after loading the view from its nib.
}

-(void)UpdateInfo
{
    /*
     http://47.94.91.183:8080/tiny-api/user/bind_mama_info?uid=819113888506318848&stageid=bfc0fa239cca5ad538d3db0ebfe31eab&isedoc=true&edoc=2017-09-23&babycount=1&babythumb=http://image.nextjoy.com/topic_img/bcd10dcaf789c123ef96f9dd91a4cefb.jpg&babynam
     
     
     */
    
    NSMutableDictionary * params =[NSMutableDictionary dictionary];
    [params safeSetObject:@"" forKey:@"uid"];//ID
    [params safeSetObject:@"" forKey:@"stageid"];//揭短唯一标识
    [params safeSetObject:@(_isKonwYuChanDate) forKey:@"isedoc"];//是否最后月经
    [params safeSetObject:self.value1tf.text forKey:@"edoc"];//最后月经/预产期 yyyy-MM-dd
    [params safeSetObject:self.value2tf.text forKey:@"babycount"];//baby数量
    [params safeSetObject:self.value3tf.text forKey:@"babycount"];//受孕方式
    [params safeSetObject:self.value4tf.text forKey:@"height"];//孕前身高
    [params safeSetObject:self.value5tf.text forKey:@"weight"];//孕前体重

    
    [[BaseSerVice sharedManager]post:@"" paramters:params success:^(NSDictionary *dic) {
        
    } failure:^(NSError *error) {
        
        MainViewController *tb =[[MainViewController alloc]init];
        self.view.window.rootViewController = tb;

    }];
    
}


- (IBAction)iKnow:(UIButton *)sender {
    self.title1lb.text = @"预产日期";
}
- (IBAction)iDontKnow:(UIButton *)sender {
    self.title1lb.text = @"最后月经";
}
- (IBAction)didUpdate:(id)sender {
    
    [self UpdateInfo];
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
    self.value1tf.inputAccessoryView =toolBar;
    self.value1tf.inputView = self.pickView;
    self.value1tf.delegate = self;
    self.value1tf.userInteractionEnabled = YES;
    
}
-(void)didhiddenPickView
{
    [self.value1tf resignFirstResponder];
}
-(void)dateChanged:(UIDatePicker *)pick
{
    UIDatePicker* control = (UIDatePicker*)pick;
    NSDate* _date = control.date;
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    
    [formater setDateFormat:@"yyyy-MM-dd"];//设置时间显示的格式，此处使用的formater格式要与字符串格式完全一致，否则转换失败
    
    NSString *dateStr = [formater stringFromDate:_date];//将日期转换成字符串
    self.value1tf.text = dateStr;
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
