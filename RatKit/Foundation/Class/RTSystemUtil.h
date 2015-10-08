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

/**
 *  获取设备唯一标识
 *
 *  @return 返回设备唯一标识
 */
+ (NSString *)getUUIDString;

/**
 *  将字典转换为xml格式字符串
 *
 *  @param dictionary 字典
 *
 *  @return 返回xml格式字符串
 */
+ (NSString *)xmlStringFromDictionary:(NSDictionary *)dictionary;

/**
 *  获取设备名称
 *
 *  @return 返回设备名称
 */
+ (NSString *)getDeviceName;

/**
 * 获取设备操作系统版本号
 *
 * @return 设备系统版本号
 */
+ (NSString*)getDeviceOSVersion;

/**
 * 获取网络服务提供商
 *
 * @return 网络服务提供商ISP
 */
+ (NSString*)getInternetSerivceProvider;

/**
 *  获取屏幕分辨率
 *
 *  @return 返回屏幕分辨率
 */
+ (NSString *)getScreenResolution;

@end
