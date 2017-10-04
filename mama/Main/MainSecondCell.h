//
//  MainSecondCell.h
//  Pm‘sApp
//
//  Created by iOSdeveloper on 2017/9/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol mainSecondCellDelegate;
@interface MainSecondCell : UITableViewCell<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *title2lb;
@property (weak, nonatomic) IBOutlet UILabel *contentlb;
-(void)buildImageWithArray:(NSArray * )images;
@property (weak, nonatomic) IBOutlet UIView *imageBGView;
@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,assign)id<mainSecondCellDelegate>delegate;
@end


@protocol mainSecondCellDelegate <NSObject>

-(void)ChangePageWithCount:(NSInteger)page;

@end
