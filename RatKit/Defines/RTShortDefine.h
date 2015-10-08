//
//  RTShortDefine.h
//  Rat
//
//  Created by lawn on 15/7/20.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#ifndef Rat_RTShortDefine_h
#define Rat_RTShortDefine_h

/**
 *  安全设置
 */
#define RT_WEAK_SELF(weakSelf)                  __weak __typeof(&*self)weakSelf = self
#define RT_WEAK(oriInstance, weakInstance)      __weak typeof(oriInstance) weakInstance = oriInstance;
#define RT_STRONG(weakInstance, strongInstance) __strong typeof(weakInstance) strongInstance = weakInstance;
#define RT_IS_NULL(obj)                         ((obj == nil) || ([obj isKindOfClass: [NSNull class]]))
#define RT_NOT_NULL(obj)                        (!RT_IS_NULL(obj))
#define RT_NOT_EMPTY(str)                       (RT_NOT_NULL(str) && [str isKindOfClass:[NSString class]] && str.length > 0)
#define RT_IS_EMPTY(str)                        (!RT_NOT_EMPTY(str))
#define RT_ARRAY_IS_EMPTY(array)                (array == nil || array.count == 0)
#define RT_ARRAY_NOT_EMPTY(array)               (!RT_ARRAY_IS_EMPTY(array))

/**
 *  颜色
 */
#define RT_ONCE_255                             (0.0039215686)
#define RT_COLOR_HEX(hex)                       RT_COLOR_HEXA(hex, 1.0)
#define RT_COLOR_RGB(R, G, B)                   RT_COLOR_RGBA(R, G, B, 1.0)
#define RT_COLOR_RGBA(R, G, B, A)               [UIColor colorWithRed:(R * RT_ONCE_255) green:(G * RT_ONCE_255) blue:(B * RT_ONCE_255) alpha:(A)]
#define RT_COLOR_HEXA(hex, A)                   [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) * RT_ONCE_255 \
                                                                green:((float)((hex & 0xFF00) >> 8)) * RT_ONCE_255 \
                                                                blue:((float)(hex & 0xFF)) * RT_ONCE_255 \
                                                                alpha:(A)]

/**
 *  字体
 */
#define RT_FONT(size)                           [UIFont systemFontOfSize:size]
#define RT_FONT_BOLD(size)                      [UIFont boldSystemFontOfSize:size]

/**
 *  图片
 */
#define RT_IMAGE(name)                          [UIImage imageNamed:name]


/**
 *  设备系统版本号
 */
#define RT_DEVICE_VERSION                       [[UIDevice currentDevice].systemVersion doubleValue]
#define RT_IOS9                                 ((int)RT_DEVICE_VERSION == 9)
#define RT_IOS8                                 ((int)RT_DEVICE_VERSION == 8)
#define RT_IOS7                                 ((int)RT_DEVICE_VERSION == 7)
#define RT_IOS6                                 ((int)RT_DEVICE_VERSION == 6)
#define RT_IOS5                                 ((int)RT_DEVICE_VERSION == 5)

#define RT_IOS9_GREATER                         (RT_DEVICE_VERSION >= 9.f)
#define RT_IOS8_GREATER                         (RT_DEVICE_VERSION >= 8.f)
#define RT_IOS7_GREATER                         (RT_DEVICE_VERSION >= 7.f)
#define RT_IOS6_GREATER                         (RT_DEVICE_VERSION >= 6.f)
#define RT_IOS5_GREATER                         (RT_DEVICE_VERSION >= 5.f)

#define RT_IOS9_SMALLER                         (RT_DEVICE_VERSION < 9.f)
#define RT_IOS8_SMALLER                         (RT_DEVICE_VERSION < 8.f)
#define RT_IOS7_SMALLER                         (RT_DEVICE_VERSION < 7.f)
#define RT_IOS6_SMALLER                         (RT_DEVICE_VERSION < 6.f)
#define RT_IOS5_SMALLER                         (RT_DEVICE_VERSION < 5.f)


/**
 *  设备类型
 */
#define RT_IS_IPAD                              (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define RT_IS_RETINA                            (RT_SCREEN_SCALE == 2)
#define RT_SCREEN_WIDTH                         [UIScreen mainScreen].bounds.size.width
#define RT_SCREEN_HEIGHT                        [UIScreen mainScreen].bounds.size.height
#define RT_SCREEN_SCALE                         [UIScreen mainScreen].scale


#endif
