//
//  RTReactNativeController.m
//  Rat
//
//  Created by lawn on 15/7/23.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTReactNativeController.h"
#import "RCTRootView.h"

@interface RTReactNativeController()

@property(nonatomic, strong)    RCTRootView  *reactView;

@end

@implementation RTReactNativeController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    [self.view addSubview:self.reactView];
}

#pragma mark - Getter && Setter

- (RCTRootView *)reactView{
    if (RT_IS_NULL(_reactView)) {
        NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle"];
        _reactView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                 moduleName: @"Rat"
                                              launchOptions:nil];
        _reactView.frame = self.view.bounds;
    }
    return _reactView;
}


@end
