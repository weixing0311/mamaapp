//
//  SearchViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/13.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *searchCardView;
@property (weak, nonatomic) IBOutlet UIView *searchHistoryCardView;
@property (weak, nonatomic) IBOutlet UITextField *searchtf;
@property (weak, nonatomic) IBOutlet UIView *litleCardView;
@property (weak, nonatomic) IBOutlet UITableView *searchHistoryTableView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    [self.searchCardView setShardow];
    [self.searchHistoryCardView setShardow];
    self.searchHistoryTableView.delegate = self;
    self.searchHistoryTableView.dataSource = self;
    [self setExtraCellLineHiddenWithTb:self.searchHistoryTableView];
    
    
    // Do any additional setup after loading the view from its nib.
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
