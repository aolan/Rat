//
//  NSDictionary+RTTextAttributesExtension.h
//  Rat
//
//  Created by lawn on 15/9/30.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (RTTextAttributesExtension)

@property (nonatomic, readonly) UIFont *rt_fontAttribute;
@property (nonatomic, readonly) UIColor *rt_colorAttribute;
@property (nonatomic, readonly) NSShadow *rt_shadowAttribute;
@property (nonatomic, readonly) UIColor *rt_backgroundColorAttribute;
@property (nonatomic, readonly) NSParagraphStyle *rt_paragraphStyle;
@property (nonatomic, readonly) NSNumber *rt_strikethroughStyle;
@property (nonatomic, readonly) NSNumber *rt_underlineStyle;
@property (nonatomic, readonly) NSNumber *rt_kern;

/**
 *  创建TextAttributes用NSDictionary实例 AVAILABLE_IOS(6_0)
 *
 *  @param fontAttribute               字体属性
 *  @param colorAttribute              颜色属性
 *  @param backgroundColorAttribute    背景色属性
 *  @param shadowAttribute             阴影属性
 *  @param paragraphStyleAttribute     段落属性
 *  @param strikethroughStyleAttribute 删除线属性
 *  @param underlineStyleAttribute     下划线属性
 *  @param kernAttribute               字间距
 *
 *  @return TextAttributes用NSDictionary实例
 */
+ (instancetype)rt_textAttributesWithFont:(UIFont *)fontAttribute
                                    color:(UIColor *)colorAttribute
                          backgroundColor:(UIColor *)backgroundColorAttribute
                                   shadow:(NSShadow *)shadowAttribute
                           paragraphStyle:(NSParagraphStyle *)paragraphStyleAttribute
                       strikethroughStyle:(NSNumber *)strikethroughStyleAttribute
                           underlineStyle:(NSNumber *)underlineStyleAttribute
                                     kern:(NSNumber *)kernAttribute;

/**
 *  创建TextAttributes用NSDictionary实例
 *
 *  @param fontAttribute   字体属性
 *  @param colorAttribute  颜色属性
 *  @param shadowAttribute 阴影属性
 *
 *  @return TextAttributes用NSDictionary实例
 */
+ (instancetype)rt_textAttributesWithFont:(UIFont *)fontAttribute
                                    color:(UIColor *)colorAttribute
                                   shadow:(NSShadow *)shadowAttribute;

@end
