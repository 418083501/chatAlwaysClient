//
//  HWTabBarViewController.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "LCTabBarViewController.h"
#import "LCTabBar.h"
#import "LCCommon.h"
#import "LCNavigationController.h"

#import "LRMainCtrl.h"
#import "LRFindCtrl.h"
#import "LRMeCtrl.h"

#define RED_POINT_TAG_STR @"RED_POINT_TAG_STR"

@interface LCTabBarViewController ()

@end

@implementation LCTabBarViewController

-(void)dealloc
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:RED_POINT_NOTIFICATION_KEY object:nil];
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    if (![[SSViewUitily defaultUitily] currentNavigationController]) {
//        return (interfaceOrientation == UIInterfaceOrientationPortrait);
//    }
//    return [[[[SSViewUitily defaultUitily] currentNavigationController] topViewController] shouldAutorotateToInterfaceOrientation:interfaceOrientation];
//}
//
//-(BOOL)shouldAutorotate
//{
//    if (![[SSViewUitily defaultUitily] currentNavigationController]) {
//        return NO;
//    }
//    return [[[[SSViewUitily defaultUitily] currentNavigationController] topViewController] shouldAutorotate];
//}
//
//
//-(void)checkRedPoint
//{
//    BOOL isShowRed = [LRCommon getIsShowRedPoint];
//    
//    LCTabBar *tabbar = (LCTabBar *)self.tabBar;
//    UIView *redPointView = [tabbar viewWithTag:[RED_POINT_TAG_STR hash]];
//    if (!redPointView) {
//        redPointView = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 + 15, 10, 5, 5)];
//        redPointView.backgroundColor = COLOR_RED;
//        redPointView.tag = RED_POINT_TAG_STR.hash;
//        redPointView.layer.masksToBounds = YES;
//        redPointView.layer.cornerRadius = redPointView.height/2;
//        
//    }
//    
//    if (isShowRed) {
//        if (!redPointView.superview) {
//            [tabbar addSubview:redPointView];
//        }
//    }else
//    {
//        if (redPointView.superview) {
//            [redPointView removeFromSuperview];
//        }
//    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LRMainCtrl *main = [[LRMainCtrl alloc] init];
    [self addChildVc:main title:@"首页" image:@"" selectedImage:@""];
    
    LRFindCtrl *find = [[LRFindCtrl alloc] init];
    [self addChildVc:find title:@"发现" image:@"" selectedImage:@""];
    
    LRMeCtrl *me = [[LRMeCtrl alloc] init];
    [self addChildVc:me title:@"我的" image:@"" selectedImage:@""];
    
    // 1.初始化子控制器
//    SSMainViewController *viewController = [[SSMainViewController alloc] init];
//    viewController.shouldShowCurveMenu=YES;
//    viewController.shouldShowBackItem=NO;
//    viewController.shouldShowRightButton=YES;
//    viewController.shouldSpansRoot=YES;
//    viewController.shouldShowTabBar = YES;
//    
//    [self addChildVc:viewController title:@"首页" image:@"tab_home_n" selectedImage:@"tab_home_c"];
////
//    /**发现*/
//    SSExploreViewController *view = [[SSExploreViewController alloc]init];
//    [self addChildVc:view title:@"发现" image:@"tab_find_n" selectedImage:@"tab_find_c"];
//
//    
//    SSPersnalViewController *me = [[SSPersnalViewController alloc] init];
//    me.shouldShowCurveMenu=YES;
//    me.shouldShowBackItem=NO;
////    me.shouldShowRightButton=YES;
//    me.shouldSpansRoot=YES;
//    me.shouldShowTabBar = YES;
//    
//    [self addChildVc:me title:@"我" image:@"tab_me_n" selectedImage:@"tab_me_c"];
//
//    // 2.更换系统自带的tabbar
    LCTabBar *tabBar = [[LCTabBar alloc] init];
    tabBar.opaque = NO;
    if ([UIDevice currentDevice].systemVersion.intValue < 7) {
        tabBar.tintColor = [UIColor colorWithRed:(245)/255.0 green:(245)/255.0 blue:(245)/255.0 alpha:1.0];
    }else
    {
//        tabBar.barTintColor = [UIColor colorWithWhite:1. alpha:1.];//[tabBar.barTintColor colorWithAlphaComponent:.5];
        tabBar.translucent = YES;
    }
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkRedPoint) name:RED_POINT_NOTIFICATION_KEY object:nil];
//    [self checkRedPoint];
    
    /*
     [self setValue:tabBar forKeyPath:@"tabBar"];相当于self.tabBar = tabBar;
     [self setValue:tabBar forKeyPath:@"tabBar"];这行代码过后，tabBar的delegate就是HWTabBarViewController
     说明，不用再设置tabBar.delegate = self;
     */
    
    /*
     1.如果tabBar设置完delegate后，再执行下面代码修改delegate，就会报错
     tabBar.delegate = self;

     2.如果再次修改tabBar的delegate属性，就会报下面的错误
     错误信息：Changing the delegate of a tab bar managed by a tab bar controller is not allowed.
     错误意思：不允许修改TabBar的delegate属性(这个TabBar是被TabBarViewController所管理的)
     */
}

+(void)initialize{
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:(104)/255.0 green:(104)/255.0 blue:(104)/255.0 alpha:1.0];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
//    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:(219)/255.0 green:(69)/255.0 blue:(0)/255.0 alpha:1.0];
    
    textAttrs[NSForegroundColorAttributeName] = [UIColor clearColor];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor clearColor];
    
    //    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    //    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];

}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    if ([UIDevice currentDevice].systemVersion.intValue >= 7) {
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else
    {
        childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    childVc.tabBarItem.title = title;
    
    
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateHighlighted];
    
    childVc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
    
//    if ([title isEqualToString:@"理财店铺"]) {
//        childVc.tabBarItem.title = @"店铺";
//    }
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    LCNavigationController *nav = [[LCNavigationController alloc] initWithRootViewController:childVc];
//    nav.extendedLayoutIncludesOpaqueBars=NO;
//    
//    nav.edgesForExtendedLayout = UIRectEdgeNone;
//    
//    nav.automaticallyAdjustsScrollViewInsets=NO;
    
    // 添加为子控制器
    [self addChildViewController:nav];
}

//#pragma mark - HWTabBarDelegate代理方法
//- (void)tabBarDidClickPlusButton:(HWTabBar *)tabBar
//{
//    HWComposeViewController *compose = [[HWComposeViewController alloc] init];
//    
//    HWNavigationController *nav = [[HWNavigationController alloc] initWithRootViewController:compose];
//    [self presentViewController:nav animated:YES completion:nil];
//}

@end
