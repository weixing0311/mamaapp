//
//  ArticleDetailViewController.m
//  mama
//
//  Created by iOSdeveloper on 2017/9/13.
//  Copyright © 2017年 -call Me WeiXing. All rights reserved.
//

#import "ArticleDetailViewController.h"

@interface ArticleDetailViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ArticleDetailViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文章详情";
    self.webView.delegate = self;
    _webView.scrollView.bouncesZoom = NO;
    _webView.scrollView.bounces = YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
    [self getHtmlInfo];
    // Do any additional setup after loading the view from its nib.
}
-(void)getHtmlInfo
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params safeSetObject:@"0082915cb8e8bfda6f2e488bc59a44aa" forKey:@"id"];
    [[BaseSerVice sharedManager]post:@"user/rec_info" paramters:params success:^(NSDictionary *dic) {
        NSDictionary * dataDict =[dic safeObjectForKey:@"data"];
        
        [self.webView loadHTMLString:[dataDict safeObjectForKey:@"content"] baseURL:nil];
        [SVProgressHUD showWithStatus:@"加载中.."];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
        
    } failure:^(NSError *error) {
        
    }];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [SVProgressHUD dismiss];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [SVProgressHUD dismiss];
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
