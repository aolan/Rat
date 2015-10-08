//
//  NSDate+RTExtension.m
//  Rat
//
//  Created by lawn on 15/9/30.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import "NSDate+RTExtension.h"

/**
 *  星期中文字符串类型
 */
typedef NS_ENUM(NSInteger, RTWeekdayStringChStyle) {
    /**
     *  类型1
     */
    RTWeekdayStringChStyle1 = 0,
    /**
     *  类型2
     */
    RTWeekdayStringChStyle2
};

@implementation NSDate (RTExtension)

#pragma mark - Private Method

- (NSString *)rt_getWeekdayStringInChWithWeekday:(NSInteger)weekday ByStyle:(RTWeekdayStringChStyle)style {
    
    if (weekday < 1 || weekday > 7) {
        return @"";
    }
    
    NSArray *weekdayStrArray = nil;
    
    switch (style) {
            
        case RTWeekdayStringChStyle1:{
            
            weekdayStrArray = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
            break;
        }
            
        case RTWeekdayStringChStyle2:{
            
            weekdayStrArray = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
            break;
        }
            
        default:{
            
            weekdayStrArray = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
            break;
        }
    }
    
    return weekdayStrArray[weekday-1];
}

#pragma mark - Property Method

- (NSInteger)rt_year {
    
    return [self rt_getComponentsWithComponentsType:NSYearCalendarUnit].year;
}

- (NSInteger)rt_month {
    
    return [self rt_getComponentsWithComponentsType:NSMonthCalendarUnit].month;
}

- (NSInteger)rt_day {
    
    return [self rt_getComponentsWithComponentsType:NSDayCalendarUnit].day;
}

- (NSInteger)rt_weekday {
    
    return [self rt_getComponentsWithComponentsType:NSWeekdayCalendarUnit].weekday;
}

- (NSString *)rt_weekday_cn1 {
    
    return [self rt_getWeekdayStringInChWithWeekday:self.rt_weekday ByStyle:RTWeekdayStringChStyle1];
}

- (NSString *)rt_weekday_cn2 {
    
    return [self rt_getWeekdayStringInChWithWeekday:self.rt_weekday ByStyle:RTWeekdayStringChStyle2];
}

- (NSInteger)rt_yyyyMMdd {
    
    NSMutableString *dateStr = [NSMutableString stringWithString:[[self description]substringToIndex:10]];
    [dateStr replaceOccurrencesOfString:@"-" withString:@"" options:NSBackwardsSearch range:NSMakeRange(0, dateStr.length)];
    
    return dateStr.integerValue;
}

#pragma mark - Ex Method

+ (NSDate *)rt_convertToLocalTimeZone:(NSDate *)GMTDate {
    
    // 获得本机的时区
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    return [GMTDate dateByAddingTimeInterval:[timeZone secondsFromGMT]];
}

+ (NSDate *)rt_getNow {
    // 获得当前格林威治时间
    NSDate *GMT = [NSDate date];
    
    return [self rt_convertToLocalTimeZone:GMT];
}

+ (NSDate *)rt_getDateWithString:(NSString *)dateString format:(NSString *)format {
    
    if (dateString == nil || [dateString isEqualToString:@""] || format == nil || [format isEqualToString:@""]) {
        return nil;
    }
    
    // 创建日期格式对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    // 设置日期格式
    [dateFormatter setDateFormat:format];
    
    // 将日期字符串转换成日期对象（格林威治时间）
    NSDate *date= [dateFormatter dateFromString:dateString];
    
    return [self rt_convertToLocalTimeZone:date];
}

+ (NSDate *)rt_dateWithTimestamp:(NSString *)timestamp {
    
    NSRange prefixRange = [timestamp rangeOfString:@"/Date("];
    NSRange suffixRange = [timestamp rangeOfString:@")/"];
    
    NSDate *date = nil;
    
    if (prefixRange.location != NSNotFound && suffixRange.location != NSNotFound) {
        
        NSMutableString *dateStr = [timestamp mutableCopy];
        [dateStr replaceCharactersInRange:suffixRange withString:@""];
        [dateStr replaceCharactersInRange:prefixRange withString:@""];
        
        date = [NSDate dateWithTimeIntervalSince1970:dateStr.doubleValue/1000.0f];
    }
    
    return date;
}

- (NSDate *)rt_convertToDayMode {
    return [NSDate rt_getDateWithString:[NSString stringWithFormat:@"%ld",(long)self.rt_yyyyMMdd] format:@"yyyyMMdd"];
}

- (NSDate *)rt_getDateAfterDays:(NSInteger)days {
    
    // 获得距离指定日期XX天日期日期 （dateByAddingTimeInterval － iOS (4.0 and later)）
    NSDate *yesterdayDate = [self dateByAddingTimeInterval:days*24*60*60];
    
    return yesterdayDate;
}

- (NSInteger)rt_getDayIntervalSinceDate:(NSDate *)date {
    
    NSDate *date1ByDayMode = [self rt_convertToDayMode];
    NSDate *date2ByDayMode = [date rt_convertToDayMode];
    
    NSInteger timeInterval = [date1ByDayMode timeIntervalSinceDate:date2ByDayMode];
    
    return ABS(timeInterval/(60*60*24));
}

- (BOOL)rt_isSameDayWithDate:(NSDate *)date {
    
    NSString *dateStr1 = [[self description]substringToIndex:10];
    NSString *dateStr2 = [[date description]substringToIndex:10];
    
    if ([dateStr1 isEqualToString:dateStr2]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)rt_isToday {
    
    if ([self rt_isSameDayWithDate:[NSDate rt_getNow]]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (NSDateComponents *)rt_getComponentsWithComponentsType:(NSInteger)components {
    
    // 获得本地日历
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    // 获得本机的时区
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    // 减去时间差 因为本地日历已经做了时区的校准
    NSDate *date = [self dateByAddingTimeInterval:-[timeZone secondsFromGMT]];
    
    // 解析日期组成
    NSDateComponents *dateComponents=[calendar components:components fromDate:date];
    
    return dateComponents;
}

@end
