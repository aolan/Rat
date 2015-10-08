//
//  NSDictionary+RTTextAttributesExtension.m
//  Rat
//
//  Created by lawn on 15/9/30.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import "NSDictionary+RTTextAttributesExtension.h"

@implementation NSDictionary (RTTextAttributesExtension)

#pragma mark Property Methods

- (UIFont *)rt_fontAttribute {
    return self[NSFontAttributeName];
}

- (UIColor *)rt_colorAttribute {
    return self[NSForegroundColorAttributeName];
}

- (NSShadow *)rt_shadowAttribute {
    return self[NSShadowAttributeName];
}

- (UIColor *)rt_backgroundColorAttribute {
    return self[NSBackgroundColorAttributeName];
}

- (NSParagraphStyle *)rt_paragraphStyle {
    return self[NSParagraphStyleAttributeName];
}

- (NSNumber *)rt_strikethroughStyle {
    return self[NSStrikethroughStyleAttributeName];
}

- (NSNumber *)rt_underlineStyle {
    return self[NSUnderlineStyleAttributeName];
}

- (NSNumber *)rt_kern {
    return self[NSKernAttributeName];
}

#pragma mark Interface Methods

+ (instancetype)rt_textAttributesWithFont:(UIFont *)fontAttribute
                                    color:(UIColor *)colorAttribute
                          backgroundColor:(UIColor *)backgroundColorAttribute
                                   shadow:(NSShadow *)shadowAttribute
                           paragraphStyle:(NSParagraphStyle *)paragraphStyleAttribute
                       strikethroughStyle:(NSNumber *)strikethroughStyleAttribute
                           underlineStyle:(NSNumber *)underlineStyleAttribute
                                     kern:(NSNumber *)kernAttribute {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    if (fontAttribute) {
        dic[NSFontAttributeName] = fontAttribute;
    }
    
    if (colorAttribute) {
        dic[NSForegroundColorAttributeName] = colorAttribute;
    }
    
    if (backgroundColorAttribute) {
        dic[NSBackgroundColorAttributeName] = backgroundColorAttribute;
    }
    
    if (shadowAttribute) {
        dic[NSShadowAttributeName] = shadowAttribute;
    }
    
    if (paragraphStyleAttribute) {
        dic[NSParagraphStyleAttributeName] = paragraphStyleAttribute;
    }
    
    if (strikethroughStyleAttribute) {
        dic[NSStrikethroughStyleAttributeName] = strikethroughStyleAttribute;
    }
    
    if (underlineStyleAttribute) {
        dic[NSUnderlineStyleAttributeName] = underlineStyleAttribute;
    }
    
    if (kernAttribute) {
        dic[NSKernAttributeName] = kernAttribute;
    }
    
    return dic;
}

+ (instancetype)rt_textAttributesWithFont:(UIFont *)fontAttribute
                                    color:(UIColor *)colorAttribute
                                   shadow:(NSShadow *)shadowAttribute {
    
    NSDictionary *dic = [NSDictionary rt_textAttributesWithFont:fontAttribute
                                                          color:colorAttribute
                                                backgroundColor:nil
                                                         shadow:shadowAttribute
                                                 paragraphStyle:nil
                                             strikethroughStyle:nil
                                                 underlineStyle:nil
                                                           kern:nil];
    
    return dic;
}

@end
