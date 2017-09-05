//
//  CallBackViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/5.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "CallBackViewController.h"

@interface CallBackViewController ()
@property (weak, nonatomic) IBOutlet UIView *textView;

@end

@implementation CallBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.textView.layer.borderWidth= 2;
    self.textView.layer.borderColor = [UIColor grayColor].CGColor;

}
- (IBAction)setUp:(id)sender {
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
