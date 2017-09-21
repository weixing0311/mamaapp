//
//  MainSecondCell.m
//  Pm‘sApp
//
//  Created by iOSdeveloper on 2017/9/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "MainSecondCell.h"

@implementation MainSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.imageBGView.frame.size.width, self.imageBGView.frame.size.height)];
    [self.imageBGView addSubview:self.scrollView];
    self.scrollView.pagingEnabled= YES;
    self.scrollView.delegate = self;
    
}
-(void)buildImageWithArray:(NSArray * )images
{
    
    self.scrollView.contentSize = CGSizeMake((JFA_SCREEN_WIDTH)*images.count, 0);
    
    for (int i =0; i<images.count; i++) {
        
        UIView * View =[[UIView alloc]initWithFrame:CGRectMake((JFA_SCREEN_WIDTH)*i, 0, JFA_SCREEN_WIDTH, self.scrollView.frame.size.height)];
        
        UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10,0,JFA_SCREEN_WIDTH-20,self.scrollView.frame.size.height)];
        imageV.image = getImage(images[i]);
        imageV.userInteractionEnabled = YES;
        [View addSubview:imageV];
        [self.scrollView addSubview:View];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)sView
{
        NSInteger index = fabs(sView.contentOffset.x) / sView.frame.size.width;
        //NSLog(@"%d",index);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"changeMainSecondCellPage" object:nil userInfo:@{@"count":[NSString stringWithFormat:@"%ld",(long)index+1]}];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
