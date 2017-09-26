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
@property (nonatomic,copy) NSString * stage;
@property (nonatomic,copy) NSString * edoc;
@property (nonatomic,copy) NSString * bcount;
@property (nonatomic,copy) NSArray  * babies;
@property (nonatomic,copy) NSString * city;

//@property (nonatomic,copy) NSString *;
//@property (nonatomic,copy) NSString *;
//@property (nonatomic,copy) NSString *;
//@property (nonatomic,copy) NSString *;
//@property (nonatomic,copy) NSString *;
//@property (nonatomic,copy) NSString *;



-(void)savemamaInfoWithdict:(NSDictionary *)dict;





-(id)getXibCellWithTitle:(NSString *)title;
-(void)showSuccessWithStatus:(NSString *)status;
-(void)showErrorWithStatus:(NSString *)status;
-(void)showInfoWithStatus:(NSString *)status;
-(void)dismiss;

@end
