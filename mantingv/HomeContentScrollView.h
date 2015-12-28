//
//  HomeContentScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseScrollView.h"
#import "HomeController.h"

#import "LFLoopScrollView.h"
#import "ChoiceNessRoom.h"
#import "ChoiceNessTheme.h"
#import "ThemeContentView.h"

@interface HomeContentScrollView : MTBaseScrollView
@property (nonatomic,weak) HomeController *homeController;
@property (nonatomic,weak) LFLoopScrollViewForMT *adScrollView;

@property (nonatomic,strong) NSMutableArray * fourButtons;
@property (nonatomic,weak) ChoiceNessTheme *choiceNessTheme;
@property (nonatomic,weak) ChoiceNessRoom *choiceNessRoom;
@property (nonatomic,weak) UIImageView *what;

@property (nonatomic,weak) ThemeContentView *themeContentView;
@end
