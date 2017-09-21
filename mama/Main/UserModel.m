//
//  UserModel.m
//  Pm‘sApp
//
//  Created by iOSdeveloper on 2017/9/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "UserModel.h"
#import <UIKit/UIKit.h>
static UserModel *model;
@implementation UserModel

+(UserModel *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[UserModel alloc]init];
    });
    return model;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        //        self.child = [NSMutableArray array];
    }
    return self;
}
-(id)getXibCellWithTitle:(NSString *)title
{
    NSArray *arr = [[NSBundle mainBundle]loadNibNamed:title owner:nil options:nil];
    if (arr) {
        return [arr lastObject];
        
    }else{
        return nil;
    }
}
-(void)showSuccessWithStatus:(NSString *)status
{
    [SVProgressHUD setMaximumDismissTimeInterval:1];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD showSuccessWithStatus:status];
}
-(void)showErrorWithStatus:(NSString *)status
{
    [SVProgressHUD setMaximumDismissTimeInterval:1];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD showErrorWithStatus:status];
}
-(void)showInfoWithStatus:(NSString *)status
{
    [SVProgressHUD setMaximumDismissTimeInterval:1];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD showInfoWithStatus:status];
}
-(void)dismiss
{
    [SVProgressHUD dismiss];
}

@end
