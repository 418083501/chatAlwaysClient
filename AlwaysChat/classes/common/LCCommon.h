//
//  LCCommon.h
//  lcs
//
//  Created by 张鹏 on 15/3/13.
//  Copyright (c) 2015年 张鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "define.h"

@interface LCCommon : NSObject
+(NSString *)getDocumentPath;
+(NSString *)getDirectoryForDocuments:(NSString *)dir;
+ (NSString *)getPathForDocuments:(NSString *)filename;
+(NSString *)getPathForDocuments:(NSString *)filename inDir:(NSString *)dir;
+(BOOL)isFileExists:(NSString *)filepath;
+(BOOL)deleteWithFilepath:(NSString *)filepath;
+(NSArray*)getFilenamesWithDir:(NSString*)dir;
+(NSString *)getUnitNumber:(NSInteger)number;

/**
 *  通过颜色值获得颜色
 */
+ (UIColor *)getColor:(NSString *)hexColor;

+(BOOL)checkIsEmptyString:(NSString *)str;

+(NSString *)saveImage:(UIImage *)image;

+(void)saveToLocalWithName:(NSString *)pathName uid:(NSString *)uid obj:(NSObject *)obj;
+(NSObject *)getLocalWithName:(NSString *)pathName uid:(NSString *)uid;
+(NSString *)countNumAndChangeformat:(NSString *)num;
@end
