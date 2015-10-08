//
//  RTConfigDefine.h
//  Rat
//
//  Created by lawn on 15/7/20.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#ifndef Rat_RTConfigDefine_h
#define Rat_RTConfigDefine_h

/**
 *  日志
 */
#if DEBUG
#   define  NSLog(...)   NSLog(__VA_ARGS__)
#else
#   define  NSLog(...)
#endif

#endif
