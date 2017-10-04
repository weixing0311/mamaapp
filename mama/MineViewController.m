//
//  MineViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/5.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "MineViewController.h"
#import "CallBackViewController.h"
#import "AbouUsViewController.h"
#import "MyInfoViewController.h"
#import "YYKnowledgeViewController.h"
@interface MineViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *birthdaylabel;
@property (weak, nonatomic) IBOutlet UIImageView *sexImage;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[UserModel shareInstance].headImgUrl]placeholderImage:getImage(@"默认头像")];
    self.nickName.text = [UserModel shareInstance].nickName;
}
- (IBAction)changeUser:(id)sender {
}
- (IBAction)myBaby:(id)sender {
    MyInfoViewController * my = [[MyInfoViewController alloc]init];
    [self.navigationController pushViewController:my animated:YES];
}
- (IBAction)pregnantWomanInfo:(id)sender {
    YYKnowledgeViewController * yyk = [[YYKnowledgeViewController alloc]init];
    [self.navigationController pushViewController:yyk animated:YES];
}
- (IBAction)aboutUs:(id)sender {
    AbouUsViewController * ab = [[AbouUsViewController alloc]init];
    [self.navigationController pushViewController:ab animated:YES];
}
- (IBAction)callBack:(id)sender {
    CallBackViewController * ab = [[CallBackViewController alloc]init];
    [self.navigationController pushViewController:ab animated:YES];

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
