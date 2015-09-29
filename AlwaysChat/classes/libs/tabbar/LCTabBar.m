//
//  HWTabBar.m
//  黑马微博2期
//
//  Created by apple on 14-10-8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

//#import "UIDevice+IdentifierAddition.h"
#import "LCTabBar.h"
@interface LCTabBar()
//@property (nonatomic, weak) UIButton *plusBtn;
@end


@implementation LCTabBar
@synthesize delegate = _delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        // 添加一个按钮到tabbar中
//        UIButton *plusBtn = [[UIButton alloc] init];
//        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
//        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
//        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
//        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
//        plusBtn.size = plusBtn.currentBackgroundImage.size;
//        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:plusBtn];
//        self.plusBtn = plusBtn;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    
//    // 1.设置加号按钮的位置
//    self.plusBtn.centerX = self.width * 0.5;
//    self.plusBtn.centerY = self.height * 0.5;
    
    // 2.设置其他tabbarButton的位置和尺寸
//    self.backgroundColor = [UIColor clearColor];
    
    if ([[UIDevice currentDevice] systemVersion].intValue < 7) {
        self.backgroundImage = [UIImage imageNamed:@"nav_bg"];
    }
    
//    self.backgroundImage = [UIImage imageNamed:@""];
//    self.alpha = .9;
    CGFloat tabbarButtonW = self.width / 3;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置宽度
            child.width = tabbarButtonW;
            child.y = 5;
            // 设置x
            child.x = tabbarButtonIndex * tabbarButtonW;

//            // 增加索引
            tabbarButtonIndex++;
            
        }
    }
}

@end
