//
//  UIImage+RTExtension.h
//  Rat
//
//  Created by lawn on 15/8/26.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RTExtension)

/**
 *  更改图片颜色
 *
 *  @param tintColor 要更改的图片颜色
 *
 *  @return 返回更改后的图片
 */
- (UIImage *)rt_imageWithTintColor:(UIColor *)tintColor;

@end
