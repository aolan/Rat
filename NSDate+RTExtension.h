//
//  NSDate+RTExtension.h
//  Rat
//
//  Created by lawn on 15/9/30.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RTExtension)

@property (nonatomic, readonly) NSInteger rt_year;
@property (nonatomic, readonly) NSInteger rt_month;
@property (nonatomic, readonly) NSInteger rt_day;
@property (nonatomic, readonly) NSInteger rt_weekday;
@property (nonatomic, readonly) NSString  *rt_weekday_cn1; // eg. 周一
@property (nonatomic, readonly) NSString  *rt_weekday_cn2; // eg. 星期一
@property (nonatomic, readonly) NSInteger rt_yyyyMMdd;

/**
 *  将格林威尼时间转为当前时区时间
 *
 *  @param GMTDate 格林威尼时间
 *
 *  @return 当前时区时间
 */
+ (NSDate *)rt_convertToLocalTimeZone:(NSDate *)GMTDate;

/**
 *  获取当前系统时间
 *
 *  @return 当前系统时间
 */
+ (NSDate *)rt_getNow;

/**
 *  通过字符串获得日期对象
 *
 *  @param dateString 日期字符串
 *  @param format     日期字符串格式 如：（@"yyyy-MM-dd HH:mm:ss"）根据日期字符串具体情况传入
 *
 *  @return 日期对象
 */
+ (NSDate *)rt_getDateWithString:(NSString *)dateString format:(NSString *)format;

/**
 *  根据时间戳获取日期对象
 *
 *  @param timestamp 时间戳字串 /Date(1416229750469+0800)/
 *
 *  @return 日期
 */
+ (NSDate *)rt_dateWithTimestamp:(NSString *)timestamp;

/**
 *  转换为天模式 yyyy-MM-dd 00:00:00
 *
 *  @return 日期
 */
- (NSDate *)rt_convertToDayMode;

/**
 *  获得距离指定日期XX天日期日期
 *
 *  @param days 距离制定日期的天数
 *
 *  @return 日期
 */
- (NSDate *)rt_getDateAfterDays:(NSInteger)days;

/**
 *  获得距离指定日期的天数
 *
 *  @param date 指定日期
 *
 *  @return 天数
 */
- (NSInteger)rt_getDayIntervalSinceDate:(NSDate *)date;

/**
 *  是否是同一天
 *
 *  @param date 指定日期
 *
 *  @return 是否是同一天
 */
- (BOOL)rt_isSameDayWithDate:(NSDate *)date;

/**
 *  是否是今天
 *
 *  @return 是否是今天
 */
- (BOOL)rt_isToday;

/**
 *  获得指定日期的详细组成信息
 *
 *  @param components NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekCalendarUnit|
 *                    NSWeekdayCalendarUnit|NSWeekOfMonthCalendarUnit）
 *
 *  @return 日期的详细组成信息
 */
- (NSDateComponents *)rt_getComponentsWithComponentsType:(NSInteger)components;

@end
