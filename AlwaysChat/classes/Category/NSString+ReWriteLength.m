//
//  NSString+ReWriteLength.m
//  Melexiudazhong
//
//  Created by lurong on 14-3-21.
//  Copyright (c) 2014年 mes. All rights reserved.
//

#import "NSString+ReWriteLength.h"

@implementation NSString (ReWriteLength)

-(NSUInteger)newLegth
{
    int length = 0;
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i<self.length; i++) {
        NSRange g ;
        g.location = i;
        g.length = 1;
        [arr addObject:[self substringWithRange:g]];
    }
    for (int i = 0; i<arr.count; i++) {
        if ([self isNOrA:arr[i]]) {
            length += 1;
        }else
        {
            length += 2;
        }
    }
    return length;
}

-(BOOL)isNOrA:(NSString *)str
{
    int a = [str characterAtIndex:0];
    if (a >= 0x4e00 && a <= 0x9fff) {
        return 0;
    }else
    {
        return 1;
    }
}

-(NSString *)subStringWithLength:(NSInteger)length
{
    NSMutableString *ss = [[NSMutableString alloc] init];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.length; i++) {
        NSRange g ;
        g.location = i;
        g.length = 1;
        [arr addObject:[self substringWithRange:g]];
    }
    int j = 0;
    for (int i = 0; i<length; i++) {
        [ss appendFormat:@"%@",arr[j]];
        if (![self isNOrA:arr[j]]) {
            i += 1;
        }
//        NSLog(@"ss.newLenth=%d",ss.newLegth);
        if (ss.newLegth+1 > length) {
            break;
        }
        j += 1;
    }
    return ss.description;
}

@end
