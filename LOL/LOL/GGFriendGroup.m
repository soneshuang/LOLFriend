//
//  GGFriendGroup.m
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "GGFriendGroup.h"
#import "GGFriend.h"

@implementation GGFriendGroup

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in self.friends) {
            GGFriend *model = [GGFriend friendWithDitionary:dic];
            [arr addObject:model];
        }
        self.friends = arr;
        self.isopen = YES;
    }
    return self;
}

+(instancetype)friendWithDitionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
}
@end
