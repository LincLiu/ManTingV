//
//  ContentScrollViewWithChooserView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewWithChooserView.h"

@implementation ContentScrollViewWithChooserView

//创建条件选择器
- (ChooserView *)chooserView{
    if (nil == _chooserView) {
        ChooserView *chooserView = [ChooserView shareChooserViewWith:CGPointMake(0, 0)];
        _chooserView = chooserView;
        [self addSubview:chooserView];
    }
    return _chooserView;
}

- (NSMutableArray *)chooserViewDataArray{
    if (nil == _chooserViewDataArray) {
        NSMutableArray *chooserViewDataArray = [[NSMutableArray alloc] init];
        _chooserViewDataArray = chooserViewDataArray;
    }
    return _chooserViewDataArray;
}
@end
