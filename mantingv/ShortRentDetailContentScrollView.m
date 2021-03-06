//
//  ShortRentDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/29.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentDetailContentScrollView.h"
#import "CheckInAndCheckOutView.h"
#import "ShortRentPriceView.h"
#import "RelatedProductContentView.h"
#import "ShortRentDetailContentScrollViewModel.h"

@interface ShortRentDetailContentScrollView ()
@property (nonatomic,weak) CheckInAndCheckOutView *checkInAndCheckOutView;
@property (nonatomic,weak) ShortRentPriceView *shortRentPriceView;
@property (nonatomic,weak) UILabel *relatedProductsLabel;
@property (nonatomic,weak) RelatedProductContentView *relatedProductContentView;
@property (nonatomic,strong) MTModel *model;
@end
@implementation ShortRentDetailContentScrollView


- (void)willMoveToSuperview:(UIView *)newSuperview{
    self.checkInAndCheckOutView.frame = CGRectMake(0, CGRectGetMaxY(self.loopScrollView.frame), SCREEN_WIDTH, 100);

    self.shortRentPriceView.frame = CGRectMake(0, CGRectGetMaxY(self.checkInAndCheckOutView.frame)+20, SCREEN_WIDTH, 100);

    self.relatedProductsLabel.frame = CGRectMake(0, CGRectGetMaxY(self.shortRentPriceView.frame), SCREEN_WIDTH, 40);

    self.relatedProductContentView.frame = CGRectMake(0, CGRectGetMaxY(self.relatedProductsLabel.frame), SCREEN_WIDTH, 0);
}

- (CheckInAndCheckOutView *)checkInAndCheckOutView{
    if (nil == _checkInAndCheckOutView) {
        CheckInAndCheckOutView *checkInAndCheckOutView = [[CheckInAndCheckOutView alloc] init];
        checkInAndCheckOutView.backgroundColor = [UIColor whiteColor];
        [self addSubview:checkInAndCheckOutView];
        _checkInAndCheckOutView = checkInAndCheckOutView;
    }
    return _checkInAndCheckOutView;
}

- (ShortRentPriceView *)shortRentPriceView{
    if (nil == _shortRentPriceView) {
        ShortRentPriceView *shortRentPriceView = [[ShortRentPriceView alloc] init];
        shortRentPriceView.backgroundColor = [UIColor whiteColor];

        shortRentPriceView.controller = self.controller;
        [self addSubview:shortRentPriceView];
        _shortRentPriceView = shortRentPriceView;
    }
    return _shortRentPriceView;
}

- (UILabel *)relatedProductsLabel{
    if (nil == _relatedProductsLabel) {
        UILabel *relatedProductsLabel = [[UILabel alloc] init];
        relatedProductsLabel.text = @"相关产品";
        relatedProductsLabel.backgroundColor = [UIColor colorWithRed:(float)238/255 green:(float)238/255 blue:(float)238/255 alpha:1.000];
        [self addSubview:relatedProductsLabel];
        _relatedProductsLabel = relatedProductsLabel;
    }
    return _relatedProductsLabel;
}

- (RelatedProductContentView *)relatedProductContentView{
    if (nil == _relatedProductContentView) {
        RelatedProductContentView *relatedProductContentView = [[RelatedProductContentView alloc] init];
        relatedProductContentView.controller = self.controller;
        relatedProductContentView.backgroundColor = [UIColor colorWithRed:(float)238/255 green:(float)238/255 blue:(float)238/255 alpha:1.000];
        [self addSubview:relatedProductContentView];
        _relatedProductContentView = relatedProductContentView;
    }
    return _relatedProductContentView;
}

#pragma mark - 从网络加载数据
- (void)setValueWith:(id)data{
    /**
     *  下载详情数据
     */
    NSString *url = [BASE_URL stringByAppendingString:[NSString stringWithFormat:@"/rent/details/%@",data]];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dic1 = [dic objectForKey:@"data"];
        ShortRentDetailContentScrollViewModel *model = [ShortRentDetailContentScrollViewModel modelWithDictionary:dic1];
        self.model = model;
        [self loadAdScrollViewData];
        [self.checkInAndCheckOutView setValueWith:model];
        [self.shortRentPriceView setValueWith:model];
        [self loadDataForRelatedContentView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误");
    }];
}


/**
 *  下载轮播图片
 */
- (void)loadAdScrollViewData{
    ShortRentDetailContentScrollViewModel *model = (ShortRentDetailContentScrollViewModel *)self.model;
    [self.loopScrollView setImageWithUrlS:model.imageGuid];
}

/**
 *  下载相关产品数据
 */

- (void)loadDataForRelatedContentView{
    ShortRentDetailContentScrollViewModel *model = (ShortRentDetailContentScrollViewModel *)self.model;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setObject:model.houseBaseName forKey:@"houseBaseName"];
    if (userGuid) {
        [parameter setObject:userGuid forKey:@"userGuid"];
    }
    if (!userGuid) {
        [parameter setObject:@""forKey:@"userGuid"];

    }

    NSString *url = [BASE_URL stringByAppendingString:@"/rent/list/matching"];

    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        [self.relatedProductContentView setValueWith:arr];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (NSMutableDictionary *)parameters{
    NSMutableDictionary *dic = [super parameters];
    if (nil == dic) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSDictionary *dictionary = @{@"houseBaseName":@"老子山•温泉养生社区",
                                     @"userGuid":[user objectForKey:USER_GUID]
                                     };
        dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
    }
    return dic;
}

@end
