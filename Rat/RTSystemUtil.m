//
//  RTSystemUtil.m
//  Rat
//
//  Created by lawn on 15/7/20.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTSystemUtil.h"
#import <UIKit/UIKit.h>

@implementation RTSystemUtil

#pragma mark -
#pragma mark Public Methods

+ (RTSystemUtil *)shareInstance {
    static dispatch_once_t once;
    static RTSystemUtil *instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

+ (RTAppLaunchModel)appLaunchModel:(NSDictionary *)launchOptions{
    
    if (launchOptions && [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey]) {
        return RTAppLaunchModelUrl;
    }
    
    if (launchOptions && [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]) {
        return RTAppLaunchModelRemoteNotification;
    }

    return RTAppLaunchModelAppIcon;
}


@end
