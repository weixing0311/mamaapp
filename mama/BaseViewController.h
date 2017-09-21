//
//  BaseViewController.h
//  mama
//
//  Created by iOSdeveloper on 2017/9/5.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
-(void)setExtraCellLineHiddenWithTb:(UITableView *)tb;
-(id)getXibCellWithTitle:(NSString *)title;
@end
