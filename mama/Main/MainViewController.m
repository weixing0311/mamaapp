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
#import "MineViewController.h"
#import "SearchViewController.h"
#import "MineViewController.h"
#import "MainFootView.h"
#import "MainTabHeadView.h"
#import "ArticleDetailViewController.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) NSMutableDictionary * infoDict;
@property (nonatomic,strong) NSMutableArray * recArray;
@property (nonatomic,strong) NSMutableDictionary * weatherDict;
@end

@implementation MainViewController
{
    NSString * weatherEstr;
    NSString * weatherCstr;
    NSString * wenDuStr;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    self.navigationController.navigationBarHidden = YES;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _recArray = [NSMutableArray array];
    _infoDict = [NSMutableDictionary dictionary];
    _dataArray = [NSMutableArray array];
    _weatherDict = [NSMutableDictionary dictionary];
    [self getMamaInfo];
    [self getWeather];
    [self getListInfo];
    [self getMamaTuijian];
    // Do any additional setup after loading the view from its nib.
}

-(void)getMamaInfo
{
    //http://47.94.91.183:8080/tiny-api/user/mama_info?uid=819113888506318848
    NSMutableDictionary * params =[NSMutableDictionary dictionary];
    [params safeSetObject:@"819113888506318848" forKey:@"uid"];
    [[BaseSerVice sharedManager]post:@"user/mama_info" paramters:params success:^(NSDictionary *dic) {
        _infoDict =[dic safeObjectForKey:@"data"];
        [[UserModel shareInstance]savemamaInfoWithdict:_infoDict];
        NSIndexPath * indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableview reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationLeft];
    } failure:^(NSError *error) {
        
    }];
}
-(void)getWeather
{
    NSString * loc = @"39.974235,116.495968";
    
    
    NSMutableDictionary * params =[NSMutableDictionary dictionary];
    [params safeSetObject:@"819113888506318848" forKey:@"uid"];
    [params safeSetObject:loc forKey:@"loc"];
    
    [[BaseSerVice sharedManager]post:@"user/weather" paramters:params success:^(NSDictionary *dic) {
        DLog(@"天气--%@",dic);
        NSDictionary * dataDic = [dic safeObjectForKey:@"data"];
        _weatherDict = [dataDic safeObjectForKey:@"heWeather5"][0];
        NSIndexPath * indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableview reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationLeft];

//        DLog(@"天气Arr--%@",nowDic);
//        weatherCstr = [[nowDic safeObjectForKey:@"cond"]objectForKey:@"txt"];
//        weatherEstr = [[[nowDic safeObjectForKey:@"aqi"]safeObjectForKey:@"city"]safeObjectForKey:@"qlty"];
//        wenDuStr =[nowDic safeObjectForKey:@"tmp"];
    } failure:^(NSError *error) {
        
    }];
}
-(void)yanZhengToken
{
    
    NSMutableDictionary * params =[NSMutableDictionary dictionary];
    [params safeSetObject:[UserModel shareInstance].uid forKey:@"uid"];
    [params safeSetObject:[UserModel shareInstance].token forKey:@"token"];
    [[BaseSerVice sharedManager]post:@"user/validate_login" paramters:params success:^(NSDictionary *dic) {
        NSMutableDictionary * dataDict=[dic safeObjectForKey:@"data"];
        NSArray * arr = [dataDict safeObjectForKey:@"blocks"];
        DLog(@"arr--%lu",(unsigned long)arr.count);
        DLog(@"ListInfo--%@",dic);
    } failure:^(NSError *error) {
        
    }];

}
-(void)getListInfo
{
    NSMutableDictionary * params =[NSMutableDictionary dictionary];
    [params safeSetObject:@"819113888506318848" forKey:@"uid"];
    [params safeSetObject:@"1" forKey:@"cid"];
    [[BaseSerVice sharedManager]post:@"channel/get_channel_data" paramters:params success:^(NSDictionary *dic) {
        NSMutableDictionary * dataDict=[dic safeObjectForKey:@"data"];
        NSArray * arr = [dataDict safeObjectForKey:@"blocks"];
        DLog(@"arr--%lu",(unsigned long)arr.count);
        _dataArray = [[arr objectAtIndex:0]objectForKey:@"items"];
        [self.tableview reloadData];
        DLog(@"ListInfo--%@",dic);
    } failure:^(NSError *error) {
        
    }];
}
-(void)getMamaTuijian
{
    NSMutableDictionary * params =[NSMutableDictionary dictionary];
    [params safeSetObject:@"819113888506318848" forKey:@"uid"];
    [[BaseSerVice sharedManager]post:@"user/mama_rec" paramters:params success:^(NSDictionary *dic) {
        _recArray =[dic safeObjectForKey:@"data"];
        DLog(@"推荐---%@",dic);
        [self.tableview reloadData];
    } failure:^(NSError *error) {
        
    }];

}
- (IBAction)didClickLeft:(id)sender
{
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
            tabHeader.allPageLabel.text = [NSString stringWithFormat:@"/%lu",(unsigned long)self.recArray.count];
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
        
        NSDictionary * dic = [UserModel shareInstance].babies[0];
        [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:[dic safeObjectForKey:@"thumb"]]placeholderImage:getImage(@"默认头像")];
        cell.nameLabel.text = [dic safeObjectForKey:@"nickname"];
        cell.dateLabel.text = [NSString stringWithFormat:@"%@ %@",[self getDate],[self getweek]];
        cell.temperatureLabel.text = [NSString stringWithFormat:@"%@°",[[_weatherDict safeObjectForKey:@"now"]objectForKey:@"tmp"]];
        cell.weather2label.text =[NSString stringWithFormat:@"%@",[[[_weatherDict safeObjectForKey:@"now"]objectForKey:@"cond"]objectForKey:@"txt"]];
        cell.airLabel.text = [NSString stringWithFormat:@"%@ %@",[[[_weatherDict safeObjectForKey:@"aqi"]objectForKey:@"city"]objectForKey:@"qlty"],[[[_weatherDict safeObjectForKey:@"aqi"]objectForKey:@"city"]objectForKey:@"aqi"]];
        
        return cell;
        
    }
    else if (indexPath.section ==1)
    {
        static NSString * identifier = @"MainSecondCell";
        MainSecondCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UserModel shareInstance]getXibCellWithTitle:identifier];
        }

        [cell buildImageWithArray:self.recArray];
        return cell;

    }
    else
    {
        static NSString * identifier = @"MainThirdCell";
        MainThirdCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UserModel shareInstance]getXibCellWithTitle:identifier];
        }
        NSDictionary * dic =[_dataArray objectAtIndex:indexPath.row];
        if (indexPath.row ==0) {
            cell.hiddView.hidden = YES;
        }
        else{
            cell.hiddView.hidden = NO;
        }
        [cell.headImageView setShardow];

        cell.titleLabel.text =[dic safeObjectForKey:@"title"];
        [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:[dic safeObjectForKey:@"thumb1"]] placeholderImage:getImage(@"背景")];
        cell.subTitleLabel.text = @"title";
        cell.contentLabel.text = [dic safeObjectForKey:@"source"];
        int type = [[dic safeObjectForKey:@"type"]intValue];
        if (type ==1) {
            cell.playImageView.hidden = YES;
        }
        else
        {
            cell.playImageView.hidden = NO;

        }

        return cell;
 
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section ==2) {
        NSDictionary * dic =[_dataArray objectAtIndex:indexPath.row];
        ArticleDetailViewController * article = [[ArticleDetailViewController alloc]init];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        article.uid = [dic safeObjectForKey:@"id"];
        [self.navigationController pushViewController:article animated:YES];
        
    }
}



//获取星期几
-(NSDateComponents *)getweek
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    comps = [calendar components:unitFlags fromDate:[NSDate date]];
    return comps;
}
-(NSString *)getDate
{
    NSDateFormatter *outputFormatter= [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"MM月dd日"];
    NSString *string= [outputFormatter stringFromDate:[NSDate date]];
    return string;
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
