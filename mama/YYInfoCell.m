//
//  YYInfoCell.m
//  mama
//
//  Created by 魏星 on 2017/10/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "YYInfoCell.h"
#import "CardCell.h"
@implementation YYInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _cardArray = [NSMutableArray array];
    // Initialization code
    self.cardCollectionView.delegate = self;
    self.cardCollectionView.alwaysBounceVertical = YES;//实现代理
    self.cardCollectionView.dataSource = self;                  //实现数据源方法
    self.cardCollectionView.backgroundColor= HEXCOLOR(0xf8f8f8);
    [self.cardView addSubview:self.cardCollectionView];
    [self.cardCollectionView registerNib:[UINib nibWithNibName:@"CardCell"bundle:nil]forCellWithReuseIdentifier:@"CardCell"];

}
-(void)setCardInfoArray:(NSArray * )array
{
    array = @[@"不好吃",@"真不好吃",@"不好吃",@"真不好吃",@"不好吃",@"真不好吃"];
    _cardArray =[NSMutableArray arrayWithArray:array];
    [self.cardCollectionView reloadData];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _cardArray.count;
}
////定义每个Section的四边间距

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);//分别为上、左、下、右
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CardCell" forIndexPath:indexPath];
    NSString * textStr = [_cardArray objectAtIndex:indexPath.row];
    cell.CardLabel.text = textStr;
    return cell;
}

//设置item大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],};
    NSString * textStr = [_cardArray objectAtIndex:indexPath.row];
    CGSize textSize = [textStr boundingRectWithSize:CGSizeMake(100, 20) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;;

    return CGSizeMake(textSize.width+10, 20);
}
//这个是两行cell之间的间距（上下行cell的间距）

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
//两个cell之间的间距（同一行的cell的间距）

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    CardCell * item = [_cardArray objectAtIndex:indexPath.row];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
