//
//  MainTabHeadView.m
//  Pm‘sApp
//
//  Created by iOSdeveloper on 2017/9/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "MainTabHeadView.h"

@implementation MainTabHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didChange:) name:@"changeMainSecondCellPage" object:nil];
    // Initialization code
}
-(void)didChange:(NSNotification *)noti
{
    if (self.tag ==1) {
        NSString * pageStr =[NSString stringWithFormat :@"%@",[noti.userInfo safeObjectForKey:@"count"]];
        self.pageLabel.text = pageStr;
  
    }
}
@end
