//
//  UIImage+RTExtension.m
//  Rat
//
//  Created by lawn on 15/8/26.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "UIImage+RTExtension.h"

@implementation UIImage (RTExtension)

#pragma mark - Interface Methods

- (UIImage *)rt_imageWithTintColor:(UIColor *)tintColor{
   return [self rt_imageWithTintColor:tintColor blendModel:kCGBlendModeDestinationIn];
}

#pragma mark - Private Methods

- (UIImage *)rt_imageWithTintColor:(UIColor *)tintColor blendModel:(CGBlendMode)blendMode{
    
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

@end
