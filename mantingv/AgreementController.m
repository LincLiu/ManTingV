//
//  AgreementController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/7.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "AgreementController.h"

@interface AgreementController ()
@property (nonatomic,weak) UIWebView *agreenmentView;
@end

@implementation AgreementController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlWithOutHouseInfoGuid = [BASE_URL stringByAppendingString:@"/order/agreement/"];
    NSString *url = [urlWithOutHouseInfoGuid stringByAppendingString:self.houseInfoGuid];
    [self.agreenmentView loadHTMLString:@"" baseURL:nil];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *agreementDTO = [dic objectForKey:@"data"];
        NSString *webString = [agreementDTO objectForKey:@"content"];
        [self.agreenmentView loadHTMLString:webString baseURL:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
    // Do any additional setup after loading the view.
}

- (UIWebView *)agreenmentView{
    if (nil == _agreenmentView) {
        UIWebView *agreenmentView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:agreenmentView];
        _agreenmentView = agreenmentView;
    }
    return _agreenmentView;
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
