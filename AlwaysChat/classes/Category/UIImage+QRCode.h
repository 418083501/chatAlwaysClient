//
//  UIImage+QRCode.h
//  lcs
//
//  Created by 张鹏 on 15/3/19.
//  Copyright (c) 2015年 张鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRCode)

+(UIImage *)QRCodeWithString:(NSString *)str;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
