//
//  ContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollView.h"
#import "ThemeScrollView.h"

@interface ContentScrollView ()
@property (nonatomic,weak) ThemeScrollView *themeScrollView;
@property (nonatomic,weak) UIImageView *what;
@end

@implementation ContentScrollView


- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.fourButtons = [[NSMutableArray alloc] init];
        
        //滚动广告视图
        
        //四个按钮
        [self setButtons];
        
        //默认两个主题
        UIButton *button = self.fourButtons[0];
        self.themeScrollView.frame = CGRectMake(0, CGRectGetMaxY(button.frame), frame.size.width, 150);

        //不知道什么鬼
        self.what.frame = CGRectMake(0, CGRectGetMaxY(self.themeScrollView.frame), frame.size.width, 200);
        
        //精选主题
        self.choiceTheme.frame = CGRectMake(0, CGRectGetMaxY(self.what.frame), frame.size.width, 100);
        [self.choiceTheme setValueWith:1 model:nil];
        
        //精选房间
        self.choiceRoom.frame = CGRectMake(0, CGRectGetMaxY(self.choiceTheme.frame), frame.size.width, 100);
        [self.choiceRoom setValueWith:0 model:nil];
    }
    return self;
}

#pragma mark - 滚动广告视图
- (LFLoopScrollView *)adScrollView{
    if (nil == _adScrollView) {
        LFLoopScrollView *adScrollView = [LFLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
        adScrollView.autoScroll = YES;
        adScrollView.backgroundColor = [UIColor greenColor];
        _adScrollView = adScrollView;
        NSArray *urls = @[@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg",@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
        [_adScrollView setImageWithUrlS:urls];
        [self addSubview:_adScrollView];
    }
    return _adScrollView;
}

#pragma  mark - 买房、入住、交换、转让按钮
- (void)setButtons{
    NSArray *titles = @[@"我要买房",@"我要入住",@"我要交换",@"我要转让"];
    NSArray *images = @[];
    for (int i=0; i<4; i++) {
        float btnX = i*ScreenWidth/4;
        float btnY = CGRectGetMaxY(self.adScrollView.frame);
        float btnW = ScreenWidth/4;
        float btnH = 25;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundColor:[UIColor blackColor]];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        button.tag = 100+i;
        [button addTarget:self action:@selector(dealButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.fourButtons addObject:button];
        [self addSubview:button];
    }
}

- (void)setButtonWithImage:(UIImage *)image frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dealButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

- (void)dealButton:(UIButton *)button{
    NSLog(@"%lu",button.tag);
}

#pragma mark - 默认的两个主题
- (ThemeScrollView *)themeScrollView{
    if (nil == _themeScrollView) {
        ThemeScrollView *themeScrollView = [[ThemeScrollView alloc] init];
        [self addSubview:themeScrollView];
        themeScrollView.backgroundColor = [UIColor blueColor];
        _themeScrollView = themeScrollView;
    }
    return _themeScrollView;
}

#pragma mark - 不知道什么鬼
- (UIImageView *)what{
    if (nil == _what) {
        UIImageView *what = [[UIImageView alloc] init];
        what.backgroundColor = [UIColor redColor];
        [self addSubview:what];
        _what = what;
    }
    return _what;
}

#pragma mark - 精选主题
- (Choice *)choiceTheme{
    if (nil == _choiceTheme) {
        Choice *choiceTheme = [[Choice alloc] init];
        choiceTheme.backgroundColor = [UIColor greenColor];
        [self addSubview:choiceTheme];
        _choiceTheme = choiceTheme;
    }
    return _choiceTheme;
}

#pragma mark - 精选房间
- (Choice *)choiceRoom{
    if (nil == _choiceRoom) {
        Choice *choiceRoom = [[Choice alloc] init];
        choiceRoom.backgroundColor = [UIColor redColor];
        [self addSubview:choiceRoom];
        _choiceRoom = choiceRoom;
    }
    return _choiceRoom;
}
@end