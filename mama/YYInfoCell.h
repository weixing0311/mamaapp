//
//  YYInfoCell.h
//  mama
//
//  Created by 魏星 on 2017/10/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYInfoCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layOut;
@property (nonatomic,strong) NSMutableArray * cardArray;
-(void)setCardInfoArray:(NSArray * )array;
@end
