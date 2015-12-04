//
//  GGHeaderView.h
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GGFriendGroup;
@interface GGHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)void(^headerViewClick)(void);
@property (nonatomic,strong)GGFriendGroup *GGGp;
+(instancetype)sectionHeaderViewForTableView:(UITableView *)tableView;
@end
