//
//  LRBaseUser.h
//  AlwaysChat
//
//  Created by 鹿容 on 15/9/28.
//  Copyright © 2015年 lurong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRBaseUser : NSObject

@property (nonatomic,assign)long long ID;

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *facePath;

@property (nonatomic,copy)NSString *sex;

@property (nonatomic,copy)NSString *location;

@property (nonatomic,copy)NSString *destrib;

@property (nonatomic,copy)NSString *username;

@end
