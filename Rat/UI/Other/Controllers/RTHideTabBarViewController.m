//
//  RTHideTabBarViewController.m
//  Rat
//
//  Created by lawn on 15/9/29.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import "RTHideTabBarViewController.h"

@implementation RTHideTabBarViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"隐藏tabbar";
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.containView.backgroundColor = [UIColor redColor];
    
//    [self showActivityViewWithMessage:@"加载中"];
    
//    [self showToastViewWithMessage:@"请输入用户名"];
    
    
    [self showAlertViewWithTitle:@"温馨提示" message:@"你确实要提交个人信息吗" cancelButton:@"取消" otherButtons:@[@"确认", @"再考虑"] afterComplete:^(NSInteger buttonIndex) {
        NSLog(@"=======%zd", buttonIndex);
 
    }];
}

@end
