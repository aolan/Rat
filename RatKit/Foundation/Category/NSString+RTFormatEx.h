//
//  NSString+RTFormatEx.h
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RTFormatEx)

/**
 *  是否是空字符串
 *
 *  @return 返回结果
 */
- (BOOL)rt_isEmpty;

/**
 *  去除空格
 *
 *  @return 返回去除空格后的字符串
 */
- (NSString*)rt_trim;

/**
 *  生成MD5字符串
 *
 *  @return MD5字符串
 */
- (NSString *)rt_MD5Hash;

/**
 *  URL字符串编码处理
 *
 *  @return 返回编码后的字符串
 */
- (NSString*)rt_URLEncode;

/**
 *  URL字符串解码
 *
 *  @return 返回URL
 */
- (NSString *)rt_URLDecodedString;

/**
 *  utf-8编码
 *
 *  @return 编码后的字符串
 */
- (NSString *)rt_UTF8Encodeing;

/**
 *  将xml格式的字符串转换为字典
 *
 *  @return 返回字典
 */
- (NSDictionary *)rt_dictionaryFromXmlString;

@end
