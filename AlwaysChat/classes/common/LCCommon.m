//
//  LCCommon.m
//  lcs
//
//  Created by 张鹏 on 15/3/13.
//  Copyright (c) 2015年 张鹏. All rights reserved.
//

#import "LCCommon.h"

@implementation LCCommon

+(NSString *)saveImage:(UIImage *)image
{
    __weak NSData *imagedata = UIImageJPEGRepresentation(image, 0.8);
    
    NSString *savedImagePath = [self genaretePicPath];
    
    [imagedata writeToFile:savedImagePath atomically:YES];
    return [savedImagePath copy];
}

+ (NSString *)genaretePicPath{
    
    NSString * picPath = [self getDirectoryForDocuments:@"pic"];
    NSString * picName = [NSString stringWithFormat:@"%@.jpg",[self curremtTimeStr]];
    NSString * fullPicPath  = [picPath stringByAppendingPathComponent:picName];
    return fullPicPath;
}

+ (NSString *)curremtTimeStr{
    
    NSDate * date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    
    NSString * timeStr = [NSString stringWithFormat:@"%f",time];
    timeStr = [timeStr stringByReplacingOccurrencesOfString:@"." withString:@""];
    return timeStr;
}

+(NSString *)getDocumentPath
{
#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
#else
    NSString* homePath = [[NSBundle mainBundle] resourcePath];
    return homePath;
#endif
}
+(NSString *)getDirectoryForDocuments:(NSString *)dir
{
    NSString* dirPath = [[self getDocumentPath] stringByAppendingPathComponent:dir];
    BOOL isDir = NO;
    BOOL isCreated = [[NSFileManager defaultManager] fileExistsAtPath:dirPath isDirectory:&isDir];
    if ( isCreated == NO || isDir == NO ) {
        NSError* error = nil;
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
        if(success == NO)
            NSLog(@"create dir error: %@",error.debugDescription);
    }
    return dirPath;
}
+ (NSString *)getPathForDocuments:(NSString *)filename
{
    return [[self getDocumentPath] stringByAppendingPathComponent:filename];
}
+(NSString *)getPathForDocuments:(NSString *)filename inDir:(NSString *)dir
{
    return [[self getDirectoryForDocuments:dir] stringByAppendingPathComponent:filename];
}
+(BOOL)isFileExists:(NSString *)filepath
{
    return [[NSFileManager defaultManager] fileExistsAtPath:filepath];
}
+(BOOL)deleteWithFilepath:(NSString *)filepath
{
    return [[NSFileManager defaultManager] removeItemAtPath:filepath error:nil];
}
+(NSArray*)getFilenamesWithDir:(NSString*)dir
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:dir error:nil];
    return fileList;
}



+ (UIColor *)getColor:(NSString *)hexColor
{
    if(hexColor.length < 6)
    {
        return [UIColor clearColor];
    }
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    UIColor *color = [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
    return color;
}

+(BOOL)checkIsEmptyString:(NSString *)str
{
    if (![str isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if (!str) {
        return YES;
    }
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0;
    
}

+(NSString *)getUnitNumber:(NSInteger)number
{
    NSString *result = [NSString stringWithFormat:@"%d",(int)number];
    double newNumber = number;
    double wan = 10000;
    double yi = 100000000;
    if (newNumber < wan) {
        return  result;
    }
    if (number / wan > 0) {
        result = [NSString stringWithFormat:@"%.1f万",newNumber / wan];
        result = [result stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    if (number / yi > 0 && newNumber > yi) {
        result = [NSString stringWithFormat:@"%.3f亿",newNumber / yi];
    }
    return result;
}

+(void)saveToLocalWithName:(NSString *)pathName uid:(NSString *)uid obj:(NSObject *)obj{
    
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *totalName = [NSString stringWithFormat:@"%@%@",uid,pathName];
    
    NSString *filename = [Path stringByAppendingPathComponent:totalName];
    [NSKeyedArchiver archiveRootObject:obj toFile:filename];
}
+(NSObject *)getLocalWithName:(NSString *)pathName uid:(NSString *)uid{
    
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *totalName = [NSString stringWithFormat:@"%@%@",uid,pathName];
    
    NSString *filename = [Path stringByAppendingPathComponent:totalName];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filename];
}

+(NSString *)countNumAndChangeformat:(NSString *)num{
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)    {        count++;        a /= 10;    }
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];    }
    [newstring insertString:string atIndex:0];
    return newstring;
}

@end
