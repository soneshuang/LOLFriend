//
//  ViewController.m
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "GGFriend.h"
#import "GGFriendGroup.h"
#import "GGTableViewCell.h"
#import "GGHeaderView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray *heros;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableV = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableV];
    
    tableV.dataSource = self;
    tableV.delegate = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    GGFriendGroup *fg= self.heros[section];
    if (fg.isopen == YES) {
        return fg.friends.count;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.heros.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    GGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[GGTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    GGFriendGroup *friendGroup = self.heros[indexPath.section];
    GGFriend *friend = friendGroup.friends[indexPath.row];
    cell.friend = friend;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    GGFriendGroup *friendGroup = self.heros[section];
    return friendGroup.name;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    GGHeaderView *headerV = [GGHeaderView sectionHeaderViewForTableView:tableView];
    GGFriendGroup *friendG = self.heros[section];
    headerV.GGGp = friendG;
    
    headerV.headerViewClick = ^{
        [tableView reloadData];
    };
    return headerV;
    
}

-(NSArray *)heros{
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hero" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            GGFriendGroup *friendGroup = [GGFriendGroup friendWithDitionary:dict];
            [models addObject:friendGroup];
        }
        _heros = models;
    }
    return _heros;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
