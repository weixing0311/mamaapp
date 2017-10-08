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
{
    CLLocationManager *_locationManager;
}
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

-(void)savemamaInfoWithdict:(NSDictionary *)dict
{

    self.uid = [dict safeObjectForKey:@"uid"];
    self.stage = [dict safeObjectForKey:@"stage"];
    self.edoc = [dict safeObjectForKey:@"edoc"];
    self.bcount = [dict safeObjectForKey:@"bcount"];
    self.babies = [NSArray arrayWithArray:[dict safeObjectForKey:@"babies"]];
    
}
-(void)setLoignInfoWithDict:(NSDictionary *)dict
{
    self.uid      = [dict safeObjectForKey:@"uid"];
    self.username    = [dict safeObjectForKey:@"username"];
    self.phone    = [dict safeObjectForKey:@"phone"];
    self.headImgUrl     = [dict safeObjectForKey:@"headpic"];
    self.nickName    = [dict safeObjectForKey:@"nickName"];
    self.sex      = [[dict safeObjectForKey:@"sex"]intValue];
    self.email      = [dict safeObjectForKey:@"email"];
    self.password    = [dict safeObjectForKey:@"birthday"];
    self.token       = [dict safeObjectForKey:@"token"];
    self.sinaid       = [dict safeObjectForKey:@"child"];
    self.qqid    = [dict safeObjectForKey:@"userType"];
    self.wxid =[dict safeObjectForKey:@"wxid"];
    self.regTime = [dict safeObjectForKey:@"regTime"];
    self.grade       = [dict safeObjectForKey:@"grade"];
    self.isVisitor    = [dict safeObjectForKey:@"isVisitor"];
    self.idCard    = [dict safeObjectForKey:@"idCard"];

}

-(void)writeToDocWithDict:(NSDictionary*)dict
{
    // NSDocumentDirectory 要查找的文件
    // NSUserDomainMask 代表从用户文件夹下找
    // 在iOS中，只有一个目录跟传入的参数匹配，所以这个集合里面只有一个元素
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"UserInfo.plist"];
    [dict writeToFile:filePath atomically:YES];
    
}
-(void)readToDoc
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [path stringByAppendingPathComponent:@"UserInfo.plist"];
    // 解档
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    self.uid      = [dict safeObjectForKey:@"uid"];
    self.username    = [dict safeObjectForKey:@"username"];
    self.phone    = [dict safeObjectForKey:@"phone"];
    self.headImgUrl     = [dict safeObjectForKey:@"headpic"];
    self.nickName    = [dict safeObjectForKey:@"nickName"];
    self.sex      = [[dict safeObjectForKey:@"sex"]intValue];
    self.email      = [dict safeObjectForKey:@"email"];
    self.password    = [dict safeObjectForKey:@"birthday"];
    self.token       = [dict safeObjectForKey:@"token"];
    self.sinaid       = [dict safeObjectForKey:@"child"];
    self.qqid    = [dict safeObjectForKey:@"userType"];
    self.wxid =[dict safeObjectForKey:@"wxid"];
    self.regTime = [dict safeObjectForKey:@"regTime"];
    self.grade       = [dict safeObjectForKey:@"grade"];
    self.isVisitor    = [dict safeObjectForKey:@"isVisitor"];
    self.idCard    = [dict safeObjectForKey:@"idCard"];
    
    self.uid = [dict safeObjectForKey:@"uid"];
    self.stage = [dict safeObjectForKey:@"stage"];
    self.edoc = [dict safeObjectForKey:@"edoc"];
    self.bcount = [dict safeObjectForKey:@"bcount"];
    self.babies = [NSArray arrayWithArray:[dict safeObjectForKey:@"babies"]];

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





-(void)getLocation
{
    if (! [CLLocationManager locationServicesEnabled]) {
        [self showInfoWithStatus:@"未开启定位服务"];
    }
    // 2
    else if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
        [_locationManager startUpdatingLocation];
    }
    // 3
    else {
        [_locationManager requestAlwaysAuthorization];
        [_locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    if (self.isFirstUpdate) {
//        // 4
//        self.isFirstUpdate = NO;
//        return;
//    }
    
    // 5
    CLLocation *newLocation = [locations lastObject];
    
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    // 反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (! error) {
            if ([placemarks count] > 0) {
                CLPlacemark *placemark = [placemarks firstObject];
                
                // 获取城市
                NSString *city = placemark.locality;
                if (! city) {
                    // 6
                    city = placemark.administrativeArea;
                }
                
            } else if ([placemarks count] == 0) {
                [self showInfoWithStatus:@"获取GPS失败"];
            }
        } else {
            [self showInfoWithStatus:@"网络错误,请检查您的网络"];
        }
    }];
    [_locationManager stopUpdatingLocation];
    
}

@end
