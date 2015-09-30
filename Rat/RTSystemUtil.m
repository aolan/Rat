//
//  RTSystemUtil.m
//  Rat
//
//  Created by lawn on 15/7/20.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTSystemUtil.h"
#import <sys/utsname.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>


#define kSecurityAcount     @"com.zodiac.amout"
#define kSecurityService    @"com.zodiac.service"

@implementation RTSystemUtil

#pragma mark Interface Methods

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

+ (NSString *)getUUIDString{
    
    NSString *uuid = nil;
    NSString *xmlStr = [SSKeychain passwordForService:kSecurityService account:kSecurityAcount];
    NSDictionary *dict = [xmlStr rt_dictionaryFromXmlString];
    
    if (dict) {
        uuid = [dict objectForKey:@"uuid"];
    }
    if (!uuid) {
        uuid = [[NSUUID UUID] UUIDString];
        [SSKeychain setPassword:[RTSystemUtil xmlStringFromDictionary:@{@"uuid":uuid}] forService:kSecurityService account:kSecurityAcount];
    }
    return uuid;
}

+ (NSString *)xmlStringFromDictionary:(NSDictionary *)dictionary{
    
    NSString *error;
    NSData * xmlData = [NSPropertyListSerialization dataFromPropertyList:dictionary
                                                                  format:NSPropertyListXMLFormat_v1_0
                                                        errorDescription:&error];
    NSString *xmlString = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
    return xmlString;
}

+ (NSString *)getDeviceName{
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    
    return platform;
}

+ (NSString*)getDeviceOSVersion{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)getInternetSerivceProvider{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    NSString *carrier = info.subscriberCellularProvider.carrierName;
    return [carrier rt_isEmpty] ? @"" : carrier;
}

+ (NSString *)getScreenResolution{
    
    //分辨率
    CGFloat width = [UIScreen mainScreen].scale * [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].scale * [UIScreen mainScreen].bounds.size.height;
    
    if (width < height) {
        return [NSString stringWithFormat:@"%.0f*%.0f",width,height];
    }else{
        return [NSString stringWithFormat:@"%.0f*%.0f",height,width];
    }
}

@end
