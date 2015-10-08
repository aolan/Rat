//
//  UIViewController+RTActivityView.h
//  Rat
//
//  Created by lawn on 15/9/30.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  设置显示时间
 */
typedef NS_ENUM(NSInteger, RTActivityViewShowTime){
    /**
     *  默认时间20s
     */
    RTActivityViewShowTimeNormal  = 0,
    /**
     *  短时间5s
     */
    RTActivityViewShowTimeShort  = 1,
    /**
     *  长时间60s
     */
    RTActivityViewShowTimeLong = 2
};


@interface UIViewController (RTActivityView)

#pragma mark - 加载框

/**
 *  显示加载框
 */
- (void)showActivityView;

/**
 *  显示加载框
 *
 *  @param showTime 显示时间
 */
- (void)showActivityViewWithShowTime:(RTActivityViewShowTime)showTime;

/**
 *  显示加载框
 *
 *  @param message 显示内容
 */
- (void)showActivityViewWithMessage:(NSString *)message;

/**
 *  显示加载框
 *
 *  @param message  显示内容
 *  @param showTime 显示时间
 */
- (void)showActivityViewWithMessage:(NSString *)message showTime:(RTActivityViewShowTime)showTime;

/**
 *  隐藏加载框
 */
- (void)hideActivityView;

/**
 *  隐藏加载框
 *
 *  @param completeBlock 隐藏后回调方法
 */
- (void)hideActivityViewAfterComplete:(void (^)())completeBlock;


#pragma mark - 提示框

/**
 *  显示提示框
 *
 *  @param message 提示内容
 */
- (void)showToastViewWithMessage:(NSString *)message;

/**
 *  显示提示框
 *
 *  @param message       提示内容
 *  @param completeBlock 提示框消失后回调
 */
- (void)showToastViewWithMessage:(NSString *)message afterComplete:(void (^)())completeBlock;


#pragma mark - 确认框

/**
 *  弹出确认框，只有一个选项
 *
 *  @param message       提示内容
 *  @param cancelButton  按钮标题
 *  @param completeBlock 点击按钮后回调
 */
- (void)showAlertViewWithMessage:(NSString *)message
                    cancelButton:(NSString *)cancelButton
                   afterComplete:(void(^)())completeBlock;

/**
 *  弹出确认框，有两个选项
 *
 *  @param message       提示内容
 *  @param cancelButton  按钮标题
 *  @param otherButton   按钮标题
 *  @param completeBlock 点击按钮回调
 */
- (void)showAlertViewWithMessage:(NSString *)message
                    cancelButton:(NSString *)cancelButton
                     otherButton:(NSString *)otherButton
                   afterComplete:(void (^)(NSInteger buttonIndex))completeBlock;


/**
 *  弹出确认框，有标题和内容，只有一个选项
 *
 *  @param title         提示标题
 *  @param message       提示内容
 *  @param cancelButton  按钮标题
 *  @param completeBlock 点击按钮回调
 */
- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                  cancelButton:(NSString *)cancelButton
                 afterComplete:(void (^)())completeBlock;

/**
 *  弹出确认框，有标题和内容，有两个选项
 *
 *  @param title         提示标题
 *  @param message       提示内容
 *  @param cancelButton  按钮标题
 *  @param otherButton   按钮标题
 *  @param completeBlock 点击按钮回调
 */
- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                  cancelButton:(NSString *)cancelButton
                   otherButton:(NSString *)otherButton
                 afterComplete:(void (^)(NSInteger buttonIndex))completeBlock;


/**
 *  弹出确认框，有标题和内容，有多个选项
 *
 *  @param title         提示标题
 *  @param message       提示内容
 *  @param cancelButton  按钮标题
 *  @param otherButtons  其他按钮标题数组
 *  @param completeBlock 点击按钮回调
 */
- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                  cancelButton:(NSString *)cancelButton
                  otherButtons:(NSArray *)otherButtons
                 afterComplete:(void (^)(NSInteger buttonIndex))completeBlock;

@end
