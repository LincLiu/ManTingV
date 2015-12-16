//
//  MineController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MineController.h"
#import "LoginController.h"
#import "MineContentScrollView.h"

@interface MineController ()
@property (nonatomic,weak) MineContentScrollView *mineContentScrollView;
@end

@implementation MineController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, -20, self.view.frame.size.width, Screenheight);
    MineContentScrollView *mineContentScrollView = [[MineContentScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mineContentScrollView];
    self.mineContentScrollView = mineContentScrollView;
    self.mineContentScrollView.controller = self;
    [self.mineContentScrollView setValueWith:nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"PPPPPPP");
    [self.mineContentScrollView setValueWith:nil];
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
