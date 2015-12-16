//
//  AddAddressView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "AddAddressView.h"

@interface AddAddressView ()
@property (nonatomic,weak) UIButton *addAddressButton;
@end
@implementation AddAddressView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    UIView *superView = self;
    
    [self.addAddressButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        make.bottom.equalTo(superView);
        make.top.equalTo(superView);
    }];
}

- (UIButton *)addAddressButton{
    if (nil == _addAddressButton) {
        UIButton *addAddressButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [addAddressButton setTitle:@"请选择联络地址" forState:UIControlStateNormal];
        [self addSubview:addAddressButton];
        _addAddressButton = addAddressButton;
    }
    return _addAddressButton;
}
@end