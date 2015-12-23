//
//  Theme.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "Theme.h"
#import "ThemeModel.h"
@interface Theme ()
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *bargainPriceLabel;
@property (nonatomic,weak) UILabel *priceLabel;
@end
@implementation Theme

//创建子控件并创建约束
- (void)willMoveToSuperview:(UIView *)newSuperview{
    UIView *superView = self;
    
    //backImage
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 四边 0
        make.edges.equalTo(superView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    //titleLabel
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 水平中心
        make.centerX.equalTo(superView);
        //距 父视图 底边 10
        make.bottom.equalTo(superView).with.offset(-10);
        
        make.width.equalTo(@100);
        make.height.equalTo(@20);
    }];
    
    //barginPriceLabel
    [self.bargainPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 上边 0
        make.top.equalTo(superView);
        //距 父视图 左边 0
        make.left.equalTo(superView);
        
        make.height.equalTo(self.priceLabel);
        make.width.equalTo(self.priceLabel);

    }];
    
    //priceLabel
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 bargainPriceLabel 下边 0
        make.top.equalTo(self.bargainPriceLabel.mas_bottom);
        //距 父视图 左边 0
        make.left.equalTo(superView);
        
    }];
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
        [backImage addGestureRecognizer:tap];
        backImage.backgroundColor = [UIColor grayColor];
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}

- (void)dealTap{
    NSLog(@"fuck");
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)bargainPriceLabel{
    if (nil == _bargainPriceLabel) {
        UILabel *bargainPriceLabel = [[UILabel alloc] init];
        bargainPriceLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:bargainPriceLabel];
        bargainPriceLabel.text = @"特价";
        _bargainPriceLabel = bargainPriceLabel;
    }
    return _bargainPriceLabel;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

- (void)setValueWith:(id)data{
    
    ThemeModel *model = [ThemeModel modelWithDictionary:data];
    self.titleLabel.text = model.name;
    self.priceLabel.text = model.price;
    
    [self.backImage lfSetImageWithURL:model.imageGuids[0]];
}
@end
