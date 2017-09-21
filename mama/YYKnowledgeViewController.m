//
//  YYKnowledgeViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/13.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "YYKnowledgeViewController.h"

@interface YYKnowledgeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *searchtf;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIView *searchCard;

@end

@implementation YYKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchCard setShardow];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self setExtraCellLineHiddenWithTb:self.tableview];
}
- (IBAction)didClickBack:(id)sender {
}
- (IBAction)changeSegment:(UIButton *)sender {
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
