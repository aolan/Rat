//
//  CABasicAnimation+RTExtension.m
//  Rat
//
//  Created by lawn on 15/9/30.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import "CABasicAnimation+RTExtension.h"

@implementation CABasicAnimation (RTExtension)

+(CABasicAnimation *)opacityForever_Animation:(CGFloat)time //永久闪烁的动画
{
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue           = [NSNumber numberWithFloat:1.0];
    animation.toValue             = [NSNumber numberWithFloat:0.0];
    animation.autoreverses        = YES;
    animation.duration            = time;
    animation.repeatCount         = FLT_MAX;
    animation.removedOnCompletion = NO;
    animation.fillMode            = kCAFillModeForwards;
    
    return animation;
}

+(CABasicAnimation *)opacityTimes_Animation:(CGFloat)repeatTimes withDuring:(CGFloat)time //有闪烁次数的动画
{
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue           = [NSNumber numberWithFloat:1.0];
    animation.toValue             = [NSNumber numberWithFloat:0.4];
    animation.repeatCount         = repeatTimes;
    animation.duration            = time;
    animation.removedOnCompletion = NO;
    animation.fillMode            = kCAFillModeForwards;
    animation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.autoreverses        = YES;
    
    return  animation;
}

+(CABasicAnimation *)moveX:(NSNumber*)x withDuring:(CGFloat)during //横向移动
{
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    animation.toValue             = x;
    animation.duration            = during;
    animation.removedOnCompletion = NO;
    animation.fillMode            = kCAFillModeForwards;
    
    return animation;
}

+(CABasicAnimation *)moveY: (NSNumber*)y withDuring: (CGFloat)during //纵向移动
{
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.toValue             = y;
    animation.duration            = during;
    animation.removedOnCompletion = NO;
    animation.fillMode            = kCAFillModeForwards;
    
    return animation;
}

+(CABasicAnimation *)scaleTo:(NSNumber *)Multiple from:(NSNumber *)orginMultiple withDuring:(CGFloat)time repeatTime:(CGFloat)repeatTimes //缩放
{
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue           = orginMultiple;
    animation.toValue             = Multiple;
    animation.duration            = time;
    animation.autoreverses        = YES;
    animation.repeatCount         = repeatTimes;
    animation.removedOnCompletion = NO;
    animation.fillMode            = kCAFillModeForwards;
    
    return animation;
}

+(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(CGFloat)time Rep:(CGFloat)repeatTimes //组合动画
{
    CAAnimationGroup *animation   = [CAAnimationGroup animation];
    
    animation.animations          = animationAry;
    animation.duration            = time;
    animation.repeatCount         = repeatTimes;
    animation.removedOnCompletion = NO;
    animation.fillMode            = kCAFillModeForwards;
    
    return animation;
}

+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path withDuring:(CGFloat)time repeatTime:(CGFloat)repeatTimes //路径动画
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.path                 = path;
    animation.removedOnCompletion  = NO;
    animation.fillMode             = kCAFillModeForwards;
    animation.timingFunction       = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.autoreverses         = NO;
    animation.duration             = time;
    animation.repeatCount          = repeatTimes;
    
    return animation;
}

+(CABasicAnimation *)moveToPoint:(CGPoint)point //点移动
{
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    animation.toValue             = [NSValue valueWithCGPoint:point];
    animation.removedOnCompletion = NO;
    animation.fillMode            = kCAFillModeForwards;
    
    return animation;
}


+(CABasicAnimation *)rotationWithDegree:(CGFloat)degree inDirection:(NSInteger)direction withDuring: (CGFloat)dur repeatTime:(NSInteger)repeatCount //旋转
{
    CATransform3D rotationTransform = CATransform3DMakeRotation(degree, 0, 0,direction);
    CABasicAnimation* animation     = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue               = [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration              = dur;
    animation.autoreverses          = NO;
    animation.cumulative            = YES;
    animation.removedOnCompletion   = NO;
    animation.fillMode              = kCAFillModeForwards;
    animation.repeatCount           = repeatCount;
    animation.delegate              = self;
    
    return animation;
}


@end
