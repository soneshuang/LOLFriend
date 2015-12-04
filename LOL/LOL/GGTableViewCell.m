//
//  GGTableViewCell.m
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "GGTableViewCell.h"

@implementation GGTableViewCell

-(void)setFriend:(GGFriend *)friend{
    _friend = friend;
    
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.intro;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.textColor = friend.vip ? [UIColor redColor] : [UIColor blackColor];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
