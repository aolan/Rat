//
//  RTTableViewController.m
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTTableViewController.h"
#import "MJRefresh.h"

@interface RTTableViewController ()

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation RTTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.containView addSubview:self.tableView];
}

#pragma mark -
#pragma mark Interface Methods

- (void)registerTableStyle:(RTTableViewStyle)style{
    
    if (style == RTTableViewStyleNone) {
        [self.tableView removeHeader];
        [self.tableView removeFooter];
    }
    
    if (style == RTTableViewStyleRefresh) {
        [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    }
    
    if (style == RTTableViewStyleMore) {
        [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    
    if (style == RTTableViewStyleBoth) {
        [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
        [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
}

- (void)endLoading{
    
    if ([self.tableView.header isRefreshing]) {
        [self.tableView.header endRefreshing];
    }
    
    if ([self.tableView.footer isRefreshing]) {
        [self.tableView.footer endRefreshing];
    }
}

- (void)refreshData{
    //Override By SubClass
}

- (void)loadMoreData{
    //Override By SubClass
}

#pragma mark -
#pragma mark UITableViewDataSource && UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}

#pragma mark -
#pragma mark Getter && Setter

- (UITableView *)tableView{
    
    if (RT_IS_NULL(_tableView)) {
        _tableView = [[UITableView alloc] initWithFrame:self.containView.bounds style:UITableViewStylePlain];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delaysContentTouches = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
