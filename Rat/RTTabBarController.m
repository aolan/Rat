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

#define RT_TAB_BAR_HEIGHT      49.0f

@interface RTTabBarController ()
@property(nonatomic,strong) NSArray *itemList;
@end

@implementation RTTabBarController

#pragma mark -
#pragma mark Interface Methods

+ (RTTabBarController *)shareInstance {
    
    static dispatch_once_t once;
    static RTTabBarController *instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (void)showTabbarWithIndex:(NSInteger)index{
    
    self.selectedIndex = index;
}


#pragma mark -
#pragma mark Lifycycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self loadViewControllers];
    
    [self initTabBarStyle];
}

- (void)loadViewControllers{
    
    _itemList = @[@"RTHomeViewController", @"RTUserCenterViewController"];

    NSMutableArray *tmpArr = [NSMutableArray array];
    for (NSString *className in _itemList) {
        RTBaseViewController *ctrl = [(RTBaseViewController *)[NSClassFromString(className) alloc] init];
        RTNavigationController *navCtrl = [[RTNavigationController alloc] initWithRootViewController:ctrl];
        [tmpArr addObject:navCtrl];
    }
    self.viewControllers = tmpArr;
}

- (void)initTabBarStyle{

    self.tabBar.height = RT_TAB_BAR_HEIGHT;
    self.tabBar.bottom = RT_SCREEN_HEIGHT;
    
    for (UITabBarItem *tabBarItem in self.tabBar.items) {
        
        tabBarItem.selectedImage = RT_IMAGE(@"rt_home_icon_sel");
 
    }
}




@end
