//
//  PregnantViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/11.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "PregnantViewController.h"

@interface PregnantViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *title1label;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *value1tf;
@property (weak, nonatomic) IBOutlet UITextField *value2tf;
@property (weak, nonatomic) IBOutlet UITextField *value3tf;
@property (weak, nonatomic) IBOutlet UITextField *value4tf;
@property (weak, nonatomic) IBOutlet UITextField *value5tf;
@property (weak, nonatomic) IBOutlet UIView *textCardView;
@end

@implementation PregnantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"孕前资料";
    [self.textCardView setShardow];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)iKnow:(UIButton *)sender {
}
- (IBAction)iDontKnow:(UIButton *)sender {
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
