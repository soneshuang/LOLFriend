//
//  GGFriend.m
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "GGFriend.h"

@implementation GGFriend

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)friendWithDitionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
}
@end
