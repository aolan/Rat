//
//  RTTabBarController.h
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTTabBarController : UITabBarController

+ (RTTabBarController *)shareInstance;

- (void)showTabbarWithIndex:(NSInteger)index;

@end
