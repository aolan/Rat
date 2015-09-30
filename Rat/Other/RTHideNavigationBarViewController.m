//
//  RTHideNavigationBarViewController.m
//  Rat
//
//  Created by lawn on 15/9/29.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import "RTHideNavigationBarViewController.h"

@implementation RTHideNavigationBarViewController

#pragma mark - Lifecycle

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}



@end
