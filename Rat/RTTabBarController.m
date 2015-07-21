//
//  RTTabBarController.m
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTTabBarController.h"
#import "RTNavigationController.h"
#import "RTBaseViewController.h"

@interface RTTabBarController ()

@property(nonatomic,strong) NSArray *itemList;

@end

@implementation RTTabBarController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self loadViewControllers];
}

- (void)loadViewControllers{

    _itemList = @[@"RTHomeViewController", @"RTUserCenterViewController"];

    NSMutableArray *tmpArr = [NSMutableArray array];
    
    for (NSString *className in _itemList) {
        RTBaseViewController *ctrl = [(RTBaseViewController *)[NSClassFromString(className) alloc] init];
        RTNavigationController *navCtrl = [[RTNavigationController alloc] initWithRootViewController:ctrl];
        [tmpArr addObject:navCtrl];
        
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                                 image:RT_IMAGE(@"rt_home_icon_nor")
                                                         selectedImage:RT_IMAGE(@"rt_home_icon_sel")];
        ctrl.tabBarItem = tabBarItem;
    }
    
    self.viewControllers = tmpArr;
}




@end
