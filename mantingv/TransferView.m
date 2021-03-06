//
//  TransferView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/13.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "TransferView.h"
#import "MyHouseDTOModel.h"
#import "HouseInfoDTOModel.h"
#import "AssignmentDTOModel.h"
#import "HouseWeekDTOModel.h"
#import "TransferDetailController.h"
#import "TransferController.h"
@interface TransferView ()
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *houseTypeLabel;
@property (nonatomic,weak) UILabel *cycleLabel;
@property (nonatomic,weak) UILabel *addressLabel;
@property (nonatomic,weak) UILabel *priceLabel;
@end
@implementation TransferView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    //背景图
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        make.left.equalTo(superView).with.offset(10);
        
        make.bottom.equalTo(superView).with.offset(-10);
        make.width.equalTo(self.backImage.mas_height);
    }];
    
    //主题
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
    }];
    
    //房型
    [self.houseTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom);
    }];
    
    //周期
    [self.cycleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.houseTypeLabel.mas_right).with.offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom);
    }];
    
    

    
    
    //地址
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
        make.top.equalTo(self.houseTypeLabel.mas_bottom);
    }];
    
    //价格
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
        make.top.equalTo(self.addressLabel.mas_bottom);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [self addGestureRecognizer:tap];
}

- (void)dealTap{
    TransferDetailController *transferDetailController = [[TransferDetailController alloc] init];
    TransferController *transferController = (TransferController *)self.controller;
    transferDetailController.myHouseGuid = transferController.myHouseGuid;
    MyHouseDTOModel *myHouseDTOModel = (MyHouseDTOModel *)self.model;
    transferDetailController.assignmentGuid = myHouseDTOModel.guid;
    transferDetailController.assignmentDTOModel = self.model;
    [self.controller.navigationController pushViewController:transferDetailController animated:YES];
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
        backImage.clipsToBounds = YES;
        backImage.layer.cornerRadius = 3;
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)houseTypeLabel{
    if (nil == _houseTypeLabel) {
        UILabel *houseTypeLabel = [[UILabel alloc] init];
        houseTypeLabel.font = [UIFont systemFontOfSize:13];
        houseTypeLabel.backgroundColor = [UIColor whiteColor];
        houseTypeLabel.textColor = [UIColor grayColor];
        [self addSubview:houseTypeLabel];
        _houseTypeLabel = houseTypeLabel;
    }
    return _houseTypeLabel;
}

- (UILabel *)cycleLabel{
    if (nil == _cycleLabel) {
        UILabel *cycleLabel = [[UILabel alloc] init];
        cycleLabel.font = [UIFont systemFontOfSize:13];
        cycleLabel.backgroundColor = [UIColor whiteColor];
        cycleLabel.textColor = [UIColor grayColor];
        [self addSubview:cycleLabel];
        _cycleLabel = cycleLabel;
    }
    return _cycleLabel;
}

- (UILabel *)addressLabel{
    if (nil == _addressLabel) {
        UILabel *addressLabel = [[UILabel alloc] init];
        addressLabel.font = [UIFont systemFontOfSize:13];
        addressLabel.backgroundColor = [UIColor whiteColor];
        addressLabel.textColor = [UIColor grayColor];
        [self addSubview:addressLabel];
        _addressLabel = addressLabel;
    }
    return _addressLabel;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.font = [UIFont systemFontOfSize:15];
        priceLabel.backgroundColor = [UIColor whiteColor];
        priceLabel.textColor = [UIColor redColor];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

- (void)setValueWith:(id)data{
    AssignmentDTOModel *assignmentDTOModel = [AssignmentDTOModel modelWithDictionary:data];
    MyHouseDTOModel *myHouseDTOModel = [MyHouseDTOModel modelWithDictionary:assignmentDTOModel.myHouseDTO];
    HouseWeekDTOModel *houseWeekDTOModel = [HouseWeekDTOModel modelWithDictionary:myHouseDTOModel.houseWeekDTO];
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:myHouseDTOModel.houseInfoDTO];
    self.model = assignmentDTOModel;
    
//    @property (nonatomic,weak) UIImageView *backImage;
//    @property (nonatomic,weak) UILabel *titleLabel;
//    @property (nonatomic,weak) UILabel *houseTypeLabel;
//    @property (nonatomic,weak) UILabel *cycleLabel;
//    @property (nonatomic,weak) UILabel *addressLabel;
//    @property (nonatomic,weak) UILabel *priceLabel;
    
    [self.backImage lfSetImageWithURL:houseInfoDTOModel.imageGuids[0]];
    self.titleLabel.text = houseInfoDTOModel.name;
    self.houseTypeLabel.text = [NSString stringWithFormat:@"房型：%@",houseInfoDTOModel.houseType];
    self.cycleLabel.text = [NSString stringWithFormat:@"周次：%@",houseWeekDTOModel.name];
    self.addressLabel.text = [NSString stringWithFormat:@"地址：%@%@",houseInfoDTOModel.province,houseInfoDTOModel.city];
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",houseInfoDTOModel.price];
}
@end
