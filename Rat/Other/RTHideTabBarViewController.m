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
}

@end
