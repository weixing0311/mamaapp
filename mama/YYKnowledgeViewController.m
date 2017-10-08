//
//  YYKnowledgeViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/13.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "YYKnowledgeViewController.h"
#import "YYInfoCell.h"
@interface YYKnowledgeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *searchtf;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIView *searchCard;
@property (nonatomic,strong) UIButton * selectBtn;
@property (nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation YYKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchCard setShardow];
    _dataArray = [NSMutableArray array];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self setExtraCellLineHiddenWithTb:self.tableview];
    self.selectBtn = (UIButton *)[self.view viewWithTag:1];
    [self getListInfo];
}

//获取标题数据
-(void)getTitleInfo
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params safeSetObject:@"819113888506318848" forKey:@"uid"];

    [[BaseSerVice sharedManager]post:@"cyclopedia/query_stage" paramters:params success:^(NSDictionary *dic) {
        
    } failure:^(NSError *error) {
        
    }];
}
//获取列表数据
-(void)getListInfo
{
    
    
    [_dataArray addObject:@"常见疾病"];
    [_dataArray addObject:@"日常生活"];
    [_dataArray addObject:@"身体变化"];
    [_dataArray addObject:@"发育状况"];
    [self.tableview reloadData];
    return;
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params safeSetObject:@"819113888506318848" forKey:@"uid"];
    [params safeSetObject:@"b5f0ff83f16765a7a60e6d3d546e068c" forKey:@"stageId"];
    [[BaseSerVice sharedManager]post:@"cyclopedia/query_sub_stage" paramters:params success:^(NSDictionary *dic) {
        
    } failure:^(NSError *error) {
        
    }];

}

- (IBAction)didClickBack:(id)sender {
}
- (IBAction)changeSegment:(UIButton *)sender {
    if (sender.tag ==self.selectBtn.tag) {
        return;
    }else{
        sender.selected = YES;
        self.selectBtn.selected =NO;
        self.selectBtn = sender;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    float height = [self calculateCellHeightWithArray:nil];
    
    return height;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"YYInfoCell";
    YYInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [self getXibCellWithTitle:identifier];
    }
//    NSDictionary * dic = [_dataArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = _dataArray[indexPath.row];
    [cell setCardInfoArray:nil];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(float)calculateCellHeightWithArray:(NSArray * )arr
{
    NSArray * array = @[@"不好吃",@"真不好吃",@"不好吃",@"真不好吃",@"不好吃",@"真不好吃"];
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],};
    float width = 0.00;
    for (int i =0; i<array.count; i++) {
        NSString * textStr = [array objectAtIndex:i];
        CGSize textSize = [textStr boundingRectWithSize:CGSizeMake(100, 20) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
        width += textSize.width+10;
    }

    
    return 80+25*(1+(int)width/(JFA_SCREEN_WIDTH-40));
    
}

-(void)ChangeMySegmentStyle:(UISegmentedControl*)segment
{
    [segment setTintColor:[UIColor whiteColor]];
    [segment setBackgroundImage:[UIImage imageNamed:@"selectImg"]
                       forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName,nil];
    
    NSDictionary *dics = [NSDictionary dictionaryWithObjectsAndKeys:HEXCOLOR(0x666666),NSForegroundColorAttributeName,nil];
    [segment setTitleTextAttributes:dics forState:UIControlStateNormal];
    [segment setTitleTextAttributes:dic forState:UIControlStateSelected];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
