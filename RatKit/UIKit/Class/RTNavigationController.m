//
//  RTNavigationController.m
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTNavigationController.h"

@interface RTNavigationController ()

@end

@implementation RTNavigationController


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self.navigationBar setBarTintColor:RT_NavigationBar_TintColor];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (RT_IOS8_GREATER) {
        
        [super pushViewController:viewController animated:animated];
        
    }else{
        
        if (animated) {
            CATransition *transition = [CATransition animation];
            transition.duration = 0.25f;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionPush;
            transition.subtype = kCATransitionFromRight;
            [self.view.layer addAnimation:transition forKey:nil];
        }
        
        [super pushViewController:viewController animated:NO];
    }
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    if (RT_IOS8_GREATER){
        
        return [super popViewControllerAnimated:animated];
        
    }else{
        
        if (animated) {
            CATransition *transition = [CATransition animation];
            transition.duration = 0.25f;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionPush;
            transition.subtype = kCATransitionFromLeft;
            [self.view.layer addAnimation:transition forKey:nil];
        }
        
        return [super popViewControllerAnimated:NO];
    }
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated{
    
    if (RT_IOS8_GREATER) {
        
        return [super popToRootViewControllerAnimated:animated];
        
    }else{
        
        if (animated) {
            CATransition *transition = [CATransition animation];
            transition.duration = 0.25f;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionPush;
            transition.subtype = kCATransitionFromLeft;
            [self.view.layer addAnimation:transition forKey:nil];
        }
        
        return [super popToRootViewControllerAnimated:NO];
    }
}

@end
