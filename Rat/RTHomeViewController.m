
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

static NSString *const  kRTHomeViewControllerCellIdentifier = @"kRTHomeViewControllerCellIdentifier";

@interface RTHomeViewController ()
@end

@implementation RTHomeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"首页";
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.tableView registerClass:[RTHomeItemCell class] forCellReuseIdentifier:kRTHomeViewControllerCellIdentifier];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RTHomeItemCell *cell = [tableView dequeueReusableCellWithIdentifier:kRTHomeViewControllerCellIdentifier];
    cell.textLabel.text = @"关于我们";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RTReactNativeController *reactCtrl = [[RTReactNativeController alloc] init];
    [self.navigationController pushViewController:reactCtrl animated:YES];
}


@end
