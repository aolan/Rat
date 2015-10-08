//
//  RTUserCenterViewController.m
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTUserCenterViewController.h"

@interface RTUserCenterViewController ()

@property(nonatomic, strong)    UIView  *testView;

@end

@implementation RTUserCenterViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.title = @"用户中心";
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.tabBarController.tabBar setTranslucent:NO];
 
    [self.containView addSubview:self.testView];
}

#pragma mark -
#pragma mark Getter Methods

- (UIView *)testView{
    if (RT_IS_NULL(_testView)) {
        _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _testView.backgroundColor = [UIColor blueColor];
    }
    return _testView;
}

@end
