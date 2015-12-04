//
//  GGFriendGroup.h
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGFriendGroup : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic) BOOL isopen;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)friendWithDitionary:(NSDictionary *)dict;
@end
