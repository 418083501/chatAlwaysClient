//
//  LCBaseCtrl.m
//  lcs
//
//  Created by 张鹏 on 15/3/13.
//  Copyright (c) 2015年 张鹏. All rights reserved.
//

#import "LCBaseCtrl.h"

@interface LCBaseCtrl ()

@end

@implementation LCBaseCtrl

-(void)buildLayout
{
    
}

-(void)addTap
{
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTouch:)]];
}

-(void)doTouch:(UIGestureRecognizer *)sender
{
    
}

-(void)doDone
{
    
}

-(void)showDoneWithTitle:(NSString *)title
{
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,80,30)];
    [rightButton addTarget:self action:@selector(doDone)forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitleColor:[LCCommon getColor:@"4a97fc"] forState:UIControlStateNormal];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.navigationController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:self action:@selector(doDone)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [LCCommon getColor:Main_BackGround_Color];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
