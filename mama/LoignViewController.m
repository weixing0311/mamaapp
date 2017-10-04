//
//  LoignViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/5.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "LoignViewController.h"

@interface LoignViewController ()
@property (weak, nonatomic) IBOutlet UIButton *verBtn;
@property (weak, nonatomic) IBOutlet UITextField *mobileTf;
@property (weak, nonatomic) IBOutlet UITextField *verTf;

@property (weak, nonatomic) IBOutlet UIView *cardView;
@end

@implementation LoignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self.cardView setShardow];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)getVer:(id)sender {
}
- (IBAction)didLoign:(id)sender {
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
