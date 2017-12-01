//
//  GuideViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/11.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "GuideViewController.h"
#import "GuideChooseViewController.h"
#import "LoignViewController.h"
@interface GuideViewController ()

@end

@implementation GuideViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    self.navigationController.navigationBarHidden = YES;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    self.tabBarController.tabBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)start:(id)sender {
    
    GuideChooseViewController * gcv = [[GuideChooseViewController alloc]init];
    [self.navigationController pushViewController:gcv animated:YES];
    
}
- (IBAction)loign:(id)sender {
    LoignViewController * lo = [[LoignViewController alloc]init];
    [self.navigationController pushViewController:lo animated:YES];
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
