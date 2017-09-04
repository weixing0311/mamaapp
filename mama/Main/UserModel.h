//
//  UserModel.h
//  Pm‘sApp
//
//  Created by iOSdeveloper on 2017/9/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
+(UserModel *)shareInstance;

-(id)getXibCellWithTitle:(NSString *)title;

@end
