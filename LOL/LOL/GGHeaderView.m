//
//  GGHeaderView.m
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "GGHeaderView.h"
#import "GGFriendGroup.h"
@implementation GGHeaderView

static NSString *HesderViewidentifier = @"sone";
+(instancetype)sectionHeaderViewForTableView:(UITableView *)tableView
{
    GGHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HesderViewidentifier];
    if (headerView == nil) {
        headerView = [[GGHeaderView alloc]initWithReuseIdentifier:HesderViewidentifier];
    }
    return headerView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:bgBtn];
        UIImage *img = [[UIImage imageNamed:@"buddy_header_bg"]resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 0) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:img forState:UIControlStateNormal];
        
        UIImage *himg = [[UIImage imageNamed:@"buddy_header_bg_highlighted"]resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 0) resizingMode:UIImageResizingModeStretch];
        [bgBtn setBackgroundImage:himg forState:UIControlStateHighlighted];
        
        [bgBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        bgBtn.imageView.contentMode = UIViewContentModeCenter;
        bgBtn.imageView.clipsToBounds = NO;
        
        [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        bgBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        bgBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        bgBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        [bgBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *lb = [[UILabel alloc]init];
        [self addSubview:lb];
        
        lb.textAlignment = NSTextAlignmentRight;
        
        _btn = bgBtn;
        _label = lb;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _btn.frame = self.bounds;
    
    _label.frame = CGRectMake(self.bounds.size.width-110, 0, 100, self.bounds.size.height);
}

-(void)setGGGp:(GGFriendGroup *)GGGp
{
    _GGGp = GGGp;
    
    [_btn setTitle:GGGp.name forState:UIControlStateNormal];
    [_label setText:[NSString stringWithFormat:@"%ld/%ld",GGGp.online,GGGp.friends.count]];
    
    if (_GGGp.isopen) {
        _btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _btn.imageView.transform = CGAffineTransformIdentity;
    }
}

-(void)btnClick:(UIButton *)btn
{
    _GGGp.isopen = !_GGGp.isopen;
    
    if (_headerViewClick) {
        _headerViewClick();
    }
    
}
@end
