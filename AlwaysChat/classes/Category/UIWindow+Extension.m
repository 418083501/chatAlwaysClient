//
//  UIWindow+Extension.m
//  黑马微博2期
//
//  Created by apple on 14-10-12.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "LCNavigationController.h"
#import "LCTabBarViewController.h"
//#import "LCLoginUser.h"

@implementation UIWindow (Extension)
- (void)switchRootViewController
{
    NSString *key = @"CFBundleVersion";
    // 上一次的使用版本（存储在沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    // 当前软件的版本号（从Info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) { // 版本号相同：这次打开和上次打开的是同一个版本
        [self changeRootCtrlWithUser];
    } else { // 这次打开的版本和上一次不一样，显示新特性
//        self.rootViewController = [[LCNewfeatureCtrl alloc] init];
        
        // 将当前的版本号存进沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
/**
 *  根据用户的登陆状态 决定选择哪一个页面
 */
-(void)changeRootCtrlWithUser{
//    int x = [LCLoginUser getLogUserFromeLocalDb];
    int x = 1;
    if (x) {
        
//        [LC_USER_MANAGER getUserInfoWithCallBack:^(BOOL rs, NSString *__weak msg) {
//            
//        }];
        
        LCTabBarViewController *tab = [[LCTabBarViewController alloc]init];
        
        self.rootViewController = tab;
        
    }else
    {
//        [LC_LOGINUSER logout];
    }
}


@end
