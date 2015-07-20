//
//  RTSystemUtil.h
//  Rat
//
//  Created by lawn on 15/7/20.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 *  APP启动方式
 */
typedef NS_ENUM(NSInteger, RTAppLaunchModel){
    /**
     *  用户点击app图标启动
     */
    RTAppLaunchModelAppIcon = 0,
    /**
     *  消息推送启动
     */
    RTAppLaunchModelRemoteNotification = 1,
    /**
     *  web页面scheme启动
     */
    RTAppLaunchModelUrl = 2
};

////////////////////////////////////////////////////////////////////////////////////////////////////

@interface RTSystemUtil : NSObject

/**
 *  单例
 *
 *  @return 返回设备系统信息单例
 */
+ (RTSystemUtil *)shareInstance;


/**
 *  返回app启动方式
 *
 *  @param launchOptions didFinishLaunchingWithOptions代理方法参数
 *
 *  @return app启动方式
 */
+ (RTAppLaunchModel)appLaunchModel:(NSDictionary *)launchOptions;

@end
