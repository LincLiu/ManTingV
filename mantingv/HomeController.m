//
//  HomeController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HomeController.h"
#import "HomeContentScrollView.h"
#import "UINavigationBar+LF.h"

@interface HomeController ()<UIScrollViewDelegate>
@property (weak,nonatomic) HomeContentScrollView* homeContentScrollView;
@property (nonatomic,weak) UISearchBar *productSearchBar;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController.navigationBar setShadowColor:[UIColor colorWithRed:0.941 green:0.879 blue:1.000 alpha:1.000]];
    
//    HomeContentScrollView *homeContentScrollView = [[HomeContentScrollView alloc] initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT+64)];
    HomeContentScrollView *homeContentScrollView = [[HomeContentScrollView alloc] initWithFrame:self.view.bounds];
    homeContentScrollView.backgroundColor = [UIColor whiteColor];
    homeContentScrollView.contentSize = CGSizeMake(0, 1000);
//    homeContentScrollView.delegate = self;
    homeContentScrollView.controller = self;
    _homeContentScrollView = homeContentScrollView;
    [self.view addSubview:homeContentScrollView];
    
    [homeContentScrollView setValueWith:nil];
    
//    //创建顶部搜索框
//    UISearchBar *productSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 10, 80, 40)];
//    productSearchBar.placeholder = @"请输入关键词";
//    self.productSearchBar = productSearchBar;
//    self.navigationItem.titleView = productSearchBar;
    
//    //创建左边下弹城市列表按钮
//    UIButton *homeCityListButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    homeCityListButton.frame = CGRectMake(0, 0, 50, 30);
//    [homeCityListButton setTitle:@"成都" forState:UIControlStateNormal];
//    [homeCityListButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [homeCityListButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
//    [homeCityListButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
//    [homeCityListButton setImageEdgeInsets:UIEdgeInsetsMake(0, 40, 0, -40)];
//    [homeCityListButton addTarget:self action:@selector(dealCityList) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeCityListButton];
    
}


- (void)viewWillDisappear:(BOOL)animated{
    [self.productSearchBar resignFirstResponder];
//    [self.navigationController.navigationBar setShadowColor:[UIColor whiteColor]];
    [super viewWillDisappear:animated];
}

- (void)dealCityList{
    NSLog(@"城市列表");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
