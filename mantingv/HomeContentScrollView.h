//
//  HomeContentScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewWithLoopScrollView.h"
#import "HomeController.h"

#import "LFLoopScrollView.h"
#import "ChoiceNessRoom.h"
#import "ChoiceNessTheme.h"
#import "ThemeContentView.h"

@interface HomeContentScrollView : ContentScrollViewWithLoopScrollView
@property (nonatomic,strong) NSMutableArray * fourButtons;
@property (nonatomic,weak) ChoiceNessTheme *choiceNessTheme;
@property (nonatomic,weak) ChoiceNessRoom *choiceNessRoom;
@property (nonatomic,weak) UIImageView *what;

@property (nonatomic,weak) ThemeContentView *themeContentView;
@end

