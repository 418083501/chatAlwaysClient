//
//  view.m
//  lcs
//
//  Created by lurong on 15/3/21.
//  Copyright (c) 2015年 张鹏. All rights reserved.
//

#import "UIView+StringTag.h"

@implementation UIView (StringTag)

-(void) stringTag:(NSString *)tag
{
    [self setTag:[tag hash]];
}

-(UIView *)viewWithStringTag:(NSString *)tag
{
    return [self viewWithTag:[tag hash]];
}

@end