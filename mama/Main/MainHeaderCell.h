//
//  MainHeaderCell.h
//  Pm‘sApp
//
//  Created by iOSdeveloper on 2017/9/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainHeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *weather1label;
@property (weak, nonatomic) IBOutlet UILabel *weather2label;
@property (weak, nonatomic) IBOutlet UIView *imageBgView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;//温度
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phaseLabel;//阶段
@property (weak, nonatomic) IBOutlet UILabel *timeLongLabel;//时长
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;//地区
@property (weak, nonatomic) IBOutlet UILabel *airLabel;

- (IBAction)didAdd:(id)sender;
@end
