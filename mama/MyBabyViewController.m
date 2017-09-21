//
//  MyBabyViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/5.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "MyBabyViewController.h"

@interface MyBabyViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headImageView;
@property (weak, nonatomic) IBOutlet UITextField *nicknametF;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTf;
@property (weak, nonatomic) IBOutlet UIButton *sexBtn;
@property (weak, nonatomic) IBOutlet UIView *cardView;

@end

@implementation MyBabyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"我的宝贝";
    [self.cardView setShardow];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)addHeadImage:(id)sender {
}
- (IBAction)didChangeSex:(id)sender {
}
- (IBAction)didAddHeadImage:(id)sender {
}
- (IBAction)didUpdate:(id)sender {
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
