//
//  MainViewController.m
//  Pm‘sApp
//
//  Created by iOSdeveloper on 2017/9/4.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "MainViewController.h"
#import "MainHeaderCell.h"
#import "MainSecondCell.h"
#import "MainThirdCell.h"
#import "MainTabHeadView.h"
#import "MainFootView.h"
#import "SearchViewController.h"
#import "MineViewController.h"
#import "MainFootView.h"
#import "MainTabHeadView.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) NSMutableArray * infoDict;
@end

@implementation MainViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    self.navigationController.navigationBarHidden = YES;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    self.tabBarController.tabBar.hidden = NO;
    
}
-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray  = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self dataArray];
    [_dataArray addObject:@"背景"];
    [_dataArray addObject:@"背景"];
    [_dataArray addObject:@"背景"];
    [_dataArray addObject:@"背景"];
    [_dataArray addObject:@"背景"];
    [_dataArray addObject:@"背景"];
    [_dataArray addObject:@"背景"];
    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)didClickLeft:(id)sender {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    MineViewController * mine = [[MineViewController alloc]init];
    [self.navigationController pushViewController: mine animated:YES];

}
- (IBAction)didClickRight:(id)sender {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    SearchViewController * search = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:search animated:YES];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0||section ==1) {
        return 1;
    }else{
        return self.dataArray.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return 500;
    }
    else
    {
        return 300;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 5;
    }else{
        return 70;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MainTabHeadView * tabHeader = [self getXibCellWithTitle:@"MainTabHeadView"];
    tabHeader.frame = CGRectMake(0, 0, JFA_SCREEN_WIDTH, 70);
    tabHeader.tag = section;
    switch (section) {
        case 0:
            tabHeader.titlelabel.text = @"";
            tabHeader.secondLabel.text = @"";
            tabHeader.allPageLabel.text = @"";
            tabHeader.pageLabel.text = @"";

            break;
        case 1:
            tabHeader.titlelabel.text = @"今日知识";
            tabHeader.secondLabel.text = @"每天告诉你宝宝的成长过程和注意事项";
            tabHeader.allPageLabel.text = [NSString stringWithFormat:@"/%lu",(unsigned long)self.dataArray.count];
            tabHeader.pageLabel.text = @"1";

            break;
        case 2:

            tabHeader.titlelabel.text = @"为您推荐";
            tabHeader.secondLabel.text = @"向您推荐时下最符合宝宝需求的妈妈神器";
            tabHeader.allPageLabel.text = @"";
            tabHeader.pageLabel.text = @"";

            break;
            
        default:
            break;
    }
    return tabHeader;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    MainFootView * foot = [self getXibCellWithTitle:@"MainFootView"];
    foot.frame = CGRectMake(0, 0, JFA_SCREEN_WIDTH, 44);
    return foot;
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0)
    {
        static NSString * identifier = @"MainHeaderCell";
        MainHeaderCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UserModel shareInstance]getXibCellWithTitle:identifier];
        }
        return cell;
        
    }
    else if (indexPath.section ==1)
    {
        static NSString * identifier = @"MainSecondCell";
        MainSecondCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UserModel shareInstance]getXibCellWithTitle:identifier];
        }

        [cell buildImageWithArray:self.dataArray];
        return cell;

    }
    else
    {
        static NSString * identifier = @"MainThirdCell";
        MainThirdCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UserModel shareInstance]getXibCellWithTitle:identifier];
        }
        if (indexPath.row ==0) {
            cell.hiddView.hidden = YES;
        }
        else{
            cell.hiddView.hidden = NO;
        }
        [cell.headImageView setShardow];

        return cell;
 
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
