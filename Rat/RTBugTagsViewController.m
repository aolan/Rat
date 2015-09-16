//
//  RTBugTagsViewController.m
//  Rat
//
//  Created by lawn on 15/9/16.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTBugTagsViewController.h"

@interface RTBugTagsViewController ()

@property (nonatomic, strong)   NSArray *bugList;

@end

@implementation RTBugTagsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Bug收集BugTags";
    
    _bugList = @[@"这离有错别字，可以直接用bugtags截图上传", @"数组越界崩溃"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _bugList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [_bugList objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.row == 1) {
        [_bugList objectAtIndex:2];
    }
}



@end
