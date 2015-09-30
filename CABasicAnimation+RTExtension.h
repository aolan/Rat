//
//  CABasicAnimation+RTExtension.h
//  Rat
//
//  Created by lawn on 15/9/30.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CABasicAnimation (RTExtension)

/**
 *  路径动画
 *
 *  @param path        动画路径
 *  @param time        动画时间
 *  @param repeatTimes 重复次数
 *
 *  @return 关键帧动画效果实例
 */
+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path withDuring:(CGFloat)time repeatTime:(CGFloat)repeatTimes;

/**
 *  X轴轴向移动动画
 *
 *  @param x      y轴轴向移动的目标位置
 *  @param during 动画时间
 *
 *  @return 动画效果实例
 */
+(CABasicAnimation *)moveX:(NSNumber*)x withDuring:(CGFloat)during;

/**
 *  Y轴轴向移动动画
 *
 *  @param y      y轴轴向移动的目标位置
 *  @param during 动画时间
 *
 *  @return 动画效果实例
 */
+(CABasicAnimation *)moveY: (NSNumber*)y withDuring:(CGFloat)during;

/**
 *  位置移动
 *
 *  @param point 点位置
 *
 *  @return 移动动画效果实例
 */
+(CABasicAnimation *)moveToPoint:(CGPoint )point;

/**
 *  不停闪烁的动画效果
 *
 *  @param time 闪烁周期的时间
 *
 *  @return 闪烁动画效果的实例
 */
+(CABasicAnimation *)opacityForever_Animation:(CGFloat)time;

/**
 *  有一定闪烁次数的动画效果
 *
 *  @param repeatTimes 闪烁次数
 *  @param time        闪烁周期的时间
 *
 *  @return 有限闪烁动画效果的实例
 */
+(CABasicAnimation *)opacityTimes_Animation:(CGFloat)repeatTimes withDuring:(CGFloat)time;

/**
 *  缩放动画效果
 *
 *  @param Multiple      缩放比率
 *  @param orginMultiple 原始缩放比率
 *  @param time          缩放动画时间
 *  @param repeatTimes   动画重复次数
 *
 *  @return 缩放动画效果
 */
+(CABasicAnimation *)scaleTo:(NSNumber *)Multiple from:(NSNumber *)orginMultiple withDuring:(CGFloat)time repeatTime:(CGFloat)repeatTimes;

/**
 *  旋转动画效果
 *
 *  @param dur         动画效果
 *  @param degree      旋转的角度
 *  @param direction   动画的旋转方向
 *  @param repeatCount 旋转动画的重复次数
 *
 *  @return 旋转动画效果的实例
 */
+(CABasicAnimation *)rotationWithDegree:(CGFloat)degree inDirection:(NSInteger)direction withDuring: (CGFloat)dur repeatTime:(NSInteger)repeatCount;

/**
 *  组合动画效果
 *
 *  @param animationAry 动画效果组合的数组
 *  @param time         动画时间
 *  @param repeatTimes  动画重复次数
 *
 *  @return 组合动画效果的实例
 */
+(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(CGFloat)time Rep:(CGFloat)repeatTimes;

@end
