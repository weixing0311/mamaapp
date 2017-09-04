//
//  MainHeaderCell.m
//  Pm‘sApp
//
//  Created by iOSdeveloper on 2017/9/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "MainHeaderCell.h"

@implementation MainHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imageBgView.layer.borderWidth= 2;
    self.imageBgView.layer.borderColor = [UIColor orangeColor].CGColor;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didAdd:(id)sender {
}
@end
