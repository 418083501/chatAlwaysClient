//
//  view.h
//  lcs
//
//  Created by lurong on 15/3/21.
//  Copyright (c) 2015年 张鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (StringTag)

-(void) stringTag:(NSString*) tag;

-(UIView *) viewWithStringTag:(NSString*)tag;

@end
