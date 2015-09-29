//
//  LRLoginUser.h
//  AlwaysChat
//
//  Created by 鹿容 on 15/9/28.
//  Copyright © 2015年 lurong. All rights reserved.
//

#import "LRBaseUser.h"

#define LOGIN_USER [LRLoginUser instance]

@interface LRLoginUser : LRBaseUser

+(instancetype)instance;

@end
