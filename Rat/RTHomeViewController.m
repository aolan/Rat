
//
//  RTHomeViewController.m
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTHomeViewController.h"
#import "RTReactView.h"
#import "RTHomeItemCell.h"
#import "RTReactNativeController.h"
#import "RTBugTagsViewController.h"
#import "RTHideTabBarViewController.h"
#import "RTHideNavigationBarViewController.h"

static NSString *const  kRTHomeViewControllerCellIdentifier = @"kRTHomeViewControllerCellIdentifier";

@interface RTHomeViewController ()

@property   (nonatomic, strong) NSArray *itemList;

@end

@implementation RTHomeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"首页";
        
        _itemList = @[@"Hide NavBar", @"Hide Tabbar", @"React-native", @"BugTags"];
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerClass:[RTHomeItemCell class] forCellReuseIdentifier:kRTHomeViewControllerCellIdentifier];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _itemList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RTHomeItemCell *cell = [tableView dequeueReusableCellWithIdentifier:kRTHomeViewControllerCellIdentifier];
    cell.textLabel.text = [_itemList objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    switch (indexPath.row) {
            
        case 0:{
            RTHideNavigationBarViewController *ctrl = [[RTHideNavigationBarViewController alloc] init];
            [self.navigationController pushViewController:ctrl animated:YES];
            break;
        }
        case 1:
        {
            RTHideTabBarViewController *bugTagsCtrl = [[RTHideTabBarViewController alloc] init];
            [self.navigationController pushViewController:bugTagsCtrl animated:YES];
            break;
        }
        case 2:{
            RTReactNativeController *reactCtrl = [[RTReactNativeController alloc] init];
            [self.navigationController pushViewController:reactCtrl animated:YES];
            break;
        }
        case 3:{
            RTBugTagsViewController *bugTagsCtrl = [[RTBugTagsViewController alloc] init];
            [self.navigationController pushViewController:bugTagsCtrl animated:YES];
            break;
        }
        default:{
            break;
        }
            
    }
}


@end
