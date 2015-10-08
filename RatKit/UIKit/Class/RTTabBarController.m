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

@implementation RTTabBarController


#pragma mark - Interface Methods

+ (id)shareInstance{
    static dispatch_once_t once;
    static RTTabBarController *instance = nil;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)switchIndex:(NSInteger)index{
    self.selectedIndex = index;
}

#pragma mark - Lifycycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self loadViewControllers];
}

- (void)loadViewControllers{
    
    NSArray *nameStrings = [self rt_viewControllersForTabBarController];
    NSArray *selImages = [self rt_tabbarSelectedImageForTabBarController];
    NSArray *norImages = [self rt_tabbarNormalImageForTabBarController];
    NSArray *itemTitles = [self rt_tabbarTitleForTabBarController];
    NSDictionary *selAttributes = [self rt_tabbarTitleAttributesSelected];
    NSDictionary *norAttributes = [self rt_tabbarTitleAttributesNormal];
 
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    for (int i = 0; i < nameStrings.count ; i++) {
        
        NSString *className = [nameStrings objectAtIndex:i];
        NSString *itemTitleStr = (itemTitles.count > i)? itemTitles[i] : nil;
        UIImage  *selImage = (selImages.count > i)? selImages[i] : nil;
        UIImage  *norImage = (norImages.count > i)? norImages[i] : nil;
        
        RTBaseViewController *ctrl = [[NSClassFromString(className) alloc] init];
        RTNavigationController *navCtrl = [[RTNavigationController alloc] initWithRootViewController:ctrl];
        [viewControllers addObject:navCtrl];
        
        //设置tabbar
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:itemTitleStr
                                                                 image:norImage
                                                         selectedImage:selImage];
        if (norAttributes) {
            [tabBarItem setTitleTextAttributes:norAttributes forState:UIControlStateNormal];
        }
        if (selAttributes) {
            [tabBarItem setTitleTextAttributes:selAttributes forState:UIControlStateSelected];
        }
        ctrl.tabBarItem = tabBarItem;
    }
    
    self.viewControllers = viewControllers;

    [self.tabBar setTintColor:selAttributes[NSForegroundColorAttributeName]];
    [self.tabBar setTranslucent:YES];
}


#pragma mark - Override By SubClass

- (NSArray *)rt_viewControllersForTabBarController{
    //Override By SubClass
    return @[];
}

- (NSArray *)rt_tabbarSelectedImageForTabBarController{
    //Override By SubClass
    return @[];
}

- (NSArray *)rt_tabbarNormalImageForTabBarController{
    //Override By SubClass
    return @[];
}

- (NSArray *)rt_tabbarTitleForTabBarController{
    //Override By SubClass
    return @[];
}

- (NSDictionary *)rt_tabbarTitleAttributesNormal{
    //Override By SubClass
    return nil;
}

- (NSDictionary *)rt_tabbarTitleAttributesSelected{
    //Override By SubClass
    return nil;
}

@end

