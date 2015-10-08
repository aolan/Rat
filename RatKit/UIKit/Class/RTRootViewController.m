//
//  RTRootViewController.m
//  Rat
//
//  Created by lawn on 15/8/25.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTRootViewController.h"

@implementation RTRootViewController

- (NSArray *)rt_viewControllersForTabBarController{
    return @[@"RTHomeViewController", @"RTUserCenterViewController"];
}

- (NSArray *)rt_tabbarSelectedImageForTabBarController{
    
    UIImage *image1 = [RT_IMAGE(@"rt_home_icon") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image2 = [RT_IMAGE(@"rt_user_icon") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    image1 = [image1 rt_imageWithTintColor:RT_COLOR_HEX(0x3f8134)];
    image2 = [image2 rt_imageWithTintColor:RT_COLOR_HEX(0x3f8134)];
    return @[image1, image2];
}

- (NSArray *)rt_tabbarNormalImageForTabBarController{
    UIImage *image1 = [RT_IMAGE(@"rt_home_icon") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image2 = [RT_IMAGE(@"rt_user_icon") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    image1 = [image1 rt_imageWithTintColor:RT_COLOR_HEX(0x444444)];
    image2 = [image2 rt_imageWithTintColor:RT_COLOR_HEX(0x444444)];
    return @[image1, image2];
}

- (NSArray *)rt_tabbarTitleForTabBarController{
    return @[@"首页", @"用户"];
}

- (NSDictionary *)rt_tabbarTitleAttributesNormal{
    return @{NSFontAttributeName:RT_FONT(10), NSForegroundColorAttributeName:RT_COLOR_HEX(0x444444)};
}

- (NSDictionary *)rt_tabbarTitleAttributesSelected{
    return @{NSFontAttributeName:RT_FONT(10), NSForegroundColorAttributeName:RT_COLOR_HEX(0x3f8134)};
}

@end
