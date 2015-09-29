//
//  LCBaseCtrl.h
//  lcs
//
//  Created by 张鹏 on 15/3/13.
//  Copyright (c) 2015年 张鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCBaseCtrl : UIViewController

-(void)showDoneWithTitle:(NSString *)title;

-(void)doDone;

-(void)addTap;

-(void)doTouch:(UIGestureRecognizer *)sender;

-(void)buildLayout;

@end
