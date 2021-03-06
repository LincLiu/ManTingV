//
//  TransferDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "TransferDetailContentScrollView.h"
#import "LFSelectionView.h"
#import "TransferDetailTopContentView.h"
#import "CommitSuccessController.h"
#import "TransferDetailController.h"
@interface TransferDetailContentScrollView ()<SeclectionViewDelegate>
@property (nonatomic,weak) TransferDetailTopContentView *transferDetailTopContentView;
@property (nonatomic,weak) LFSelectionView *selectView;
@property (nonatomic,weak) UIButton *commitButton;
@end

@implementation TransferDetailContentScrollView

- (LFSelectionView *)selectView{
    if (nil == _selectView) {
        LFSelectionView *selectView = [[LFSelectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.transferDetailTopContentView.frame), SCREEN_WIDTH, 0)];
        selectView.backgroundColor = [UIColor greenColor];
        [self addSubview:selectView];
        _selectView = selectView;
    }
    return _selectView;
}

- (TransferDetailTopContentView *)transferDetailTopContentView{
    if (nil == _transferDetailTopContentView) {
        TransferDetailTopContentView *transferDetailTopContentView = [[TransferDetailTopContentView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
        [self addSubview:transferDetailTopContentView];
        _transferDetailTopContentView = transferDetailTopContentView;
    }
    return _transferDetailTopContentView;
}

- (UIButton *)commitButton{
    if (nil == _commitButton) {
        UIButton *commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        commitButton.backgroundColor = [UIColor orangeColor];
        commitButton.frame = CGRectMake(10, CGRectGetMaxY(self.selectView.frame), SCREEN_WIDTH-20, 40);
        [commitButton addTarget:self action:@selector(dealCommit) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:commitButton];
        _commitButton = commitButton;
    }
    return _commitButton;
}

- (void)selectView:(UIView *)selectView{
    CGRect frame = self.commitButton.frame;
    frame.origin.y = CGRectGetMaxY(selectView.frame);
    
    self.commitButton.frame =frame;
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.commitButton.frame));
}

- (void)setValueWith:(id)data{
    [self.transferDetailTopContentView setValueWith:data];
    
    [self.commitButton setTitle:@"提交信息" forState:UIControlStateNormal];
    self.selectView.delegate = self;
}

- (void)dealCommit{
    TransferDetailController *transferDetailController = (TransferDetailController *)self.controller;
    NSString *urlWithOutGuid = [BASE_URL stringByAppendingString:@"/assignment/change/"];
    NSString *url = [NSString stringWithFormat:@"%@%@/%@",urlWithOutGuid,transferDetailController.assignmentGuid,transferDetailController.myHouseGuid];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSString *result = [dic objectForKey:@"result"];
        if ([@"SUCCESS" isEqualToString:result]) {
            CommitSuccessController *commitSuccessController = [[CommitSuccessController alloc] init];
            [self.controller.navigationController pushViewController:commitSuccessController animated:YES];
        }
        else{
            [KVNProgress showErrorWithStatus:result];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误");
    }];
}
@end
