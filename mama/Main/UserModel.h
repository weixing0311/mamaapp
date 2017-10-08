//
//  UserModel.h
//  Pm‘sApp
//
//  Created by iOSdeveloper on 2017/9/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface UserModel : NSObject<CLLocationManagerDelegate>
+(UserModel *)shareInstance;


@property (nonatomic,copy) NSString * uid;
@property (nonatomic,copy) NSString * headImgUrl;
@property (nonatomic,assign) int   sex;
@property (nonatomic,copy) NSString * username;
@property (nonatomic,copy) NSString * nickName;
@property (nonatomic,copy) NSString * phone;
@property (nonatomic,copy) NSString * email;
@property (nonatomic,copy) NSString * password;


//第三方id
@property (nonatomic,copy) NSString * wxid;
@property (nonatomic,copy) NSString * googleid;
@property (nonatomic,copy) NSString * facebookid;
@property (nonatomic,copy) NSString * qqid;
@property (nonatomic,copy) NSString * sinaid;


@property (nonatomic,copy) NSString * stage;
@property (nonatomic,copy) NSString * edoc;
@property (nonatomic,copy) NSString * bcount;
@property (nonatomic,copy) NSArray  * babies;
@property (nonatomic,copy) NSString * city;
@property (nonatomic,copy) NSString * account;
@property (nonatomic,copy) NSString * status;
@property (nonatomic,copy) NSString * regSource;
@property (nonatomic,copy) NSString * utime;
@property (nonatomic,copy) NSString * newsStr;
@property (nonatomic,copy) NSString * realName;
@property (nonatomic,copy) NSString * headpicthumb;
@property (nonatomic,copy) NSString * udid;
@property (nonatomic,copy) NSString * type;
@property (nonatomic,copy) NSString * idCard;
@property (nonatomic,copy) NSString * isVisitor;//是不是游客 /0否1是
@property (nonatomic,copy) NSString * grade;//等级
@property (nonatomic,copy) NSString * regTime;
@property (nonatomic,copy) NSString * token;


-(void)savemamaInfoWithdict:(NSDictionary *)dict;





-(id)getXibCellWithTitle:(NSString *)title;
-(void)showSuccessWithStatus:(NSString *)status;
-(void)showErrorWithStatus:(NSString *)status;
-(void)showInfoWithStatus:(NSString *)status;
-(void)dismiss;

@end
