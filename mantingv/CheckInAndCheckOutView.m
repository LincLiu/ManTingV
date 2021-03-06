//
//  CheckInAndCheckOutView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "CheckInAndCheckOutView.h"
#import "ShortRentDetailContentScrollViewModel.h"
@interface CheckInAndCheckOutView ()
@property (nonatomic,weak) UILabel *checkInLabel;
@property (nonatomic,weak) UILabel *checkOutLabel;

@property (nonatomic,weak) UILabel *checkInDayLabel;
@property (nonatomic,weak) UILabel *checkOutDayLabel;

@property (nonatomic,weak) UILabel *checkInMonthLabel;
@property (nonatomic,weak) UILabel *checkOutMonthLabel;

@property (nonatomic,weak) UILabel *checkInWeekDayLabel;
@property (nonatomic,weak) UILabel *checkOutWeekDayLabel;

@property (nonatomic,weak) UIView *segementationLine;
@property (nonatomic,weak) UIView *horizontalSegementationLine;


@end
@implementation CheckInAndCheckOutView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    //入住
    [self.checkInLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        
        make.left.equalTo(superView);
        
        make.right.equalTo(self.checkOutLabel.mas_left);
    }];
    
    //退房
    [self.checkOutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);

        make.right.equalTo(superView);
        
        make.width.equalTo(self.checkInLabel);
    }];
    
    //入住 天
    [self.checkInDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(20);
        
        make.top.equalTo(self.horizontalSegementationLine.mas_bottom).with.offset(20);
    }];
    
    //退房 天
    [self.checkOutDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.segementationLine.mas_right).with.offset(20);
        
        make.top.equalTo(self.horizontalSegementationLine.mas_bottom).with.offset(20);
    }];
    
    //入住 月
    [self.checkInMonthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.horizontalSegementationLine).with.offset(10);
        
        make.left.equalTo(self.checkInDayLabel.mas_right).with.offset(10);
    }];
    
    //退房 月
    [self.checkOutMonthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.horizontalSegementationLine).with.offset(10);
        
        make.left.equalTo(self.checkOutDayLabel.mas_right).with.offset(10);

    }];
    
    //入住 周几
    [self.checkInWeekDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.checkInMonthLabel.mas_bottom).with.offset(5);
        
        make.left.equalTo(self.checkInDayLabel.mas_right).with.offset(10);
    }];
    
    //退房 周几
    [self.checkOutWeekDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.checkOutMonthLabel.mas_bottom).with.offset(5);
        
        make.left.equalTo(self.checkOutDayLabel.mas_right).with.offset(10);
    }];
    
    //分割线
    [self.segementationLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(superView);
        
        make.top.equalTo(self.horizontalSegementationLine.mas_bottom).with.offset(5);
        
        make.bottom.equalTo(superView).with.offset(-5);
        
        make.width.equalTo(@1);
    }];
    
    //水平分割线
    [self.horizontalSegementationLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.checkInLabel.mas_bottom);
        
        make.left.equalTo(superView);
        
        make.right.equalTo(superView);
        
        make.height.equalTo(@1);
    }];
}

- (UILabel *)checkInLabel{
    if (nil == _checkInLabel) {
        UILabel *checkInLabel = [[UILabel alloc] init];
        checkInLabel.textAlignment = NSTextAlignmentCenter;
        checkInLabel.textColor = [UIColor grayColor];
        [self addSubview:checkInLabel];
        checkInLabel.text = @"入住";
        _checkInLabel = checkInLabel;
    }
    return _checkInLabel;
}

- (UILabel *)checkOutLabel{
    if (nil == _checkOutLabel) {
        UILabel *checkOutLabel = [[UILabel alloc] init];
        checkOutLabel.textAlignment = NSTextAlignmentCenter;
        checkOutLabel.textColor = [UIColor grayColor];
        [self addSubview:checkOutLabel];
        checkOutLabel.text = @"退房";
        _checkOutLabel = checkOutLabel;
    }
    return _checkOutLabel;
}

- (UILabel *)checkInDayLabel{
    if (nil == _checkInDayLabel) {
        UILabel *checkInDayLabel = [[UILabel alloc] init];
        checkInDayLabel.textColor = [UIColor whiteColor];
        checkInDayLabel.backgroundColor = [UIColor colorWithRed:(float)254/255 green:(float)122/255 blue:(float)120/255 alpha:1.000];
        [self addSubview:checkInDayLabel];
        _checkInDayLabel = checkInDayLabel;
    }
    return _checkInDayLabel;
}

- (UILabel *)checkOutDayLabel{
    if (nil == _checkOutDayLabel) {
        UILabel *checkOutDayLabel = [[UILabel alloc] init];
        checkOutDayLabel.textColor = [UIColor whiteColor];
        checkOutDayLabel.backgroundColor = [UIColor colorWithRed:(float)254/255 green:(float)122/255 blue:(float)120/255 alpha:1.000];
        [self addSubview:checkOutDayLabel];
        _checkOutDayLabel = checkOutDayLabel;
    }
    return _checkOutDayLabel;
}

- (UILabel *)checkInMonthLabel{
    if (nil == _checkInMonthLabel) {
        UILabel *checkInMonthLabel = [[UILabel alloc] init];

        [self addSubview:checkInMonthLabel];
        _checkInMonthLabel = checkInMonthLabel;
    }
    return _checkInMonthLabel;
}

- (UILabel *)checkOutMonthLabel{
    if (nil == _checkOutMonthLabel) {
        UILabel *checkOutMonthLabel = [[UILabel alloc] init];

        [self addSubview:checkOutMonthLabel];
        _checkOutMonthLabel = checkOutMonthLabel;
    }
    return _checkOutMonthLabel;
}


- (UILabel *)checkInWeekDayLabel{
    if (nil == _checkInWeekDayLabel) {
        UILabel *checkInWeekDayLabel = [[UILabel alloc] init];
        checkInWeekDayLabel.textColor = [UIColor grayColor];
        [self addSubview:checkInWeekDayLabel];
        _checkInWeekDayLabel = checkInWeekDayLabel;
    }
    return _checkInWeekDayLabel;
}

- (UILabel *)checkOutWeekDayLabel{
    if (nil == _checkOutWeekDayLabel) {
        UILabel *checkOutWeekDayLabel = [[UILabel alloc] init];
        checkOutWeekDayLabel.textColor = [UIColor grayColor];
        [self addSubview:checkOutWeekDayLabel];
        _checkOutWeekDayLabel = checkOutWeekDayLabel;
    }
    return _checkOutWeekDayLabel;
}

- (UIView *)segementationLine{
    if (nil == _segementationLine) {
        UIView *segementationLine = [[UIView alloc] init];
        segementationLine.backgroundColor = [UIColor grayColor];
        [self addSubview:segementationLine];
        _segementationLine = segementationLine;
    }
    return _segementationLine;
}

- (UIView *)horizontalSegementationLine{
    if (nil == _horizontalSegementationLine) {
        UIView *horizontalSegementationLine = [[UIView alloc] init];
        horizontalSegementationLine.backgroundColor = [UIColor grayColor];
        [self addSubview:horizontalSegementationLine];
        _horizontalSegementationLine = horizontalSegementationLine;
    }
    return _horizontalSegementationLine;
}

- (void)setValueWith:(id)data{
    ShortRentDetailContentScrollViewModel *model = (ShortRentDetailContentScrollViewModel *)data;
//    @property (nonatomic,weak) UILabel *checkInLabel;
//    @property (nonatomic,weak) UILabel *checkOutLabel;
//    
//    @property (nonatomic,weak) UILabel *checkInDayLabel;
//    @property (nonatomic,weak) UILabel *checkOutDayLabel;
//    
//    @property (nonatomic,weak) UILabel *checkInMonthLabel;
//    @property (nonatomic,weak) UILabel *checkOutMonthLabel;
//    
//    @property (nonatomic,weak) UILabel *checkInWeekDayLabel;
//    @property (nonatomic,weak) UILabel *checkOutWeekDayLabel;
//    
//    @property (nonatomic,weak) UIView *segementationLine;
//    @property (nonatomic,weak) UIView *horizontalSegementationLine;
    
    //时间格式为2015-12-16
    NSArray *checkIntimes =[model.checkInDate componentsSeparatedByString:@"-"];
    NSArray *leaveTimes = [model.leaveDate componentsSeparatedByString:@"-"];
    self.checkInDayLabel.text = [NSString stringWithFormat:@"%@号",checkIntimes[2]];
    self.checkOutDayLabel.text = [NSString stringWithFormat:@"%@号",leaveTimes[2]];
    
    self.checkInMonthLabel.text = [NSString stringWithFormat:@"%@月",checkIntimes[1]];
    self.checkOutMonthLabel.text = [NSString stringWithFormat:@"%@月",leaveTimes[1]];
    
    self.checkInWeekDayLabel.text = [NSString stringWithFormat:@"%@年",checkIntimes[0]];
    self.checkOutWeekDayLabel.text = [NSString stringWithFormat:@"%@年",leaveTimes[0]];
}
@end
