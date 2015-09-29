//
//  LRLoginUser.m
//  AlwaysChat
//
//  Created by 鹿容 on 15/9/28.
//  Copyright © 2015年 lurong. All rights reserved.
//

#import "LRLoginUser.h"

@implementation LRLoginUser

+(instancetype)instance
{
    static LRLoginUser *user;
    if (!user) {
        user = [[LRLoginUser alloc] init];
    }
    return user;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self makeSelfWithLocal];
    }
    return self;
}

+(NSString *)loginUserLocalPath
{
    return @"";
}

-(void)makeSelfWithLocal
{
    self.ID = 10000;
    self.name = @"lulu";
    self.facePath = @"http://img5.duitang.com/uploads/item/201503/26/20150326161657_aL8FW.jpeg";
    self.destrib = @"鹿哥霸气";
    self.sex = @"男";
}

@end
