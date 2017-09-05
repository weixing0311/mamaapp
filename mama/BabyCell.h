//
//  BabyCell.h
//  mama
//
//  Created by iOSdeveloper on 2017/9/5.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BabyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *headImageView;
@property (weak, nonatomic) IBOutlet UITextField *birthdaytf;
@property (weak, nonatomic) IBOutlet UITextField *nicknametf;
@property (weak, nonatomic) IBOutlet UIButton *sexBtn;

@end
