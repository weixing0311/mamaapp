//
//  LoignViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/5.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "LoignViewController.h"
#import "MainViewController.h"
@interface LoignViewController ()
@property (weak, nonatomic) IBOutlet UIButton *verBtn;
@property (weak, nonatomic) IBOutlet UITextField *mobileTf;
@property (weak, nonatomic) IBOutlet UITextField *verTf;

@property (weak, nonatomic) IBOutlet UIView *cardView;
@end

@implementation LoignViewController
{
    int timeNumber;
    NSTimer * _timer;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    self.tabBarController.tabBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self.cardView setShardow];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)getVer:(id)sender {
    timeNumber = 59;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshTime) userInfo:nil repeats:YES];
    self.verBtn.enabled = NO;
    
    
    NSMutableDictionary *param =[ NSMutableDictionary dictionary];
    [param setObject:self.mobileTf.text forKey:@"phone"];
    [param setObject:@"2" forKey:@"type"];
    [param safeSetObject:@"io-ssssa1111" forKey:@"cid"];
    [[BaseSerVice sharedManager]post:@"user/send_phone_code" paramters:param success:^(NSDictionary *dic) {
        
        [[UserModel shareInstance] showSuccessWithStatus:@"已发送"];
        
    } failure:^(NSError * error) {
        NSLog(@"faile--%@",error);
        [_timer invalidate];
        [self.verBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.verBtn.enabled = YES;
        
        NSDictionary *dic = error.userInfo;
        if ([[dic allKeys]containsObject:@"message"]) {
            UIAlertController *al = [UIAlertController alertControllerWithTitle:@"提示" message:[dic objectForKey:@"message"] preferredStyle:UIAlertControllerStyleAlert];
            
            [al addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            [self presentViewController:al animated:YES completion:nil];
            
        }else{
            [[UserModel shareInstance] showErrorWithStatus:@"发送失败"];
        }
        
    }];
    
    DLog(@"点击获取验证码");
}

-(void)refreshTime
{
    if (timeNumber ==0) {
        [_timer invalidate];
        [self.verBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.verBtn.enabled = YES;
        return;
    }
    NSLog(@"%d",timeNumber);
    [self.verBtn setTitle:[NSString stringWithFormat: @"%ld秒后可重新获取",(long)timeNumber] forState:UIControlStateNormal];
    timeNumber --;
}

- (IBAction)didLoign:(id)sender {
    if ([self.mobileTf.text isEqualToString:@""]||[self.mobileTf.text isEqualToString:@" "]||!self.mobileTf.text) {
        [[UserModel shareInstance] showInfoWithStatus:@"请输入手机号"];
        return;
    }
    if ([self.verTf.text isEqualToString:@""]||[self.verTf.text isEqualToString:@" "]||!self.verTf.text) {
        [[UserModel shareInstance] showInfoWithStatus:@"请输入验证码"];
        
        return;
    }
    [SVProgressHUD showWithStatus:@"登录中。。。"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    
    NSMutableDictionary *param =[ NSMutableDictionary dictionary];
    [param setObject:self.mobileTf.text forKey:@"phone"];
    [param setObject:self.verTf.text forKey:@"code"];
    [param setObject:@"1" forKey:@"push_os"];
    [param safeSetObject:@"ios" forKey:@"channel"];
    [param safeSetObject:@"1.0.0" forKey:@"ver"];
    DLog(@"param--%@",param);
     [[BaseSerVice sharedManager]post:@"user/login_phone" paramters:param success:^(NSDictionary *dic) {
        [SVProgressHUD dismiss];
        [[UserModel shareInstance] showSuccessWithStatus:@"登录成功"];
        
        
        [_timer invalidate];
        [self.verBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.verBtn.enabled = YES;
        
         MainViewController * main = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
         UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:main];
         self.view.window.rootViewController = nav;
        
//        [[UserModel shareInstance]setInfoWithDic:[dic objectForKey:@"data"]];
//        [[NSUserDefaults standardUserDefaults]setObject:[[dic objectForKey:@"data"]objectForKey:@"userId"] forKey:kMyloignInfo];
        
    } failure:^(NSError *error) {
        
        //        [[UserModel shareInstance] showErrorWithStatus:@"登录失败"];
        [_timer invalidate];
        [self.verBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.verBtn.enabled = YES;
        
    }];

}
- (IBAction)weiboLoign:(id)sender {
}
- (IBAction)weixinLoign:(id)sender {
}
- (IBAction)QQloign:(id)sender {
}
- (IBAction)agreement:(id)sender {
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
