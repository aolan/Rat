//
//  UIViewController+RTNavigationBar.h
//  Rat
//
//  Created by lawn on 15/9/29.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (RTNavigationBar)

#pragma mark - Actions

/**
 *  返回上一页
 */
- (void)rt_goBackAction;

/**
 *  返回首页
 */
- (void)rt_goHomeAction;


#pragma mark - View Settings

/**
 *  设置标题视图
 *
 *  @param titleView 标题视图
 */
- (void)rt_setTitleWithView:(UIView *)titleView;

/**
 *  增加导航栏返回按钮
 */
- (UIButton *)rt_addBackBarButton;

/**
 *  添加导航栏左侧按钮
 *
 *  @param target    事件对象
 *  @param action    事件方法
 *  @param title     按钮标题
 *  @param needClear 是否需要清除已存在的barButton
 */
- (UIButton *)rt_addLeftBarButtonWithTarget:(id)target
                                     action:(SEL)action
                                      title:(NSString *)title
                                  needClear:(BOOL)needClear;

/**
 *  添加导航栏左侧按钮
 *
 *  @param target         事件对象
 *  @param action         事件方法
 *  @param normalImage    正常状态的Icon图片
 *  @param highlightImage 高亮状态的Icon图片
 *  @param needClear      是否需要清除已存在的barButton
 */
- (UIButton *)rt_addLeftBarButtonWithTarget:(id)target
                                     action:(SEL)action
                                normalImage:(UIImage *)normalImage
                             highlightImage:(UIImage *)highlightImage
                                  needClear:(BOOL)needClear;

/**
 *  添加导航栏左侧按钮
 *
 *  @param target         事件对象
 *  @param action         事件方法
 *  @param customView     自定义视图
 *  @param needClear      是否需要清除已存在的barButton
 */
- (UIButton *)rt_addLeftBarButtonWithTarget:(id)target
                                     action:(SEL)action
                                 customView:(UIView *)customView
                                  needClear:(BOOL)needClear;

/**
 *  添加导航栏右侧按钮
 *
 *  @param target    事件对象
 *  @param action    事件方法
 *  @param title     按钮标题
 *  @param needClear 是否需要清除已存在的barButton
 */
- (UIButton *)rt_addRightBarButtonWithTarget:(id)target
                                      action:(SEL)action
                                       title:(NSString *)title
                                   needClear:(BOOL)needClear;

/**
 *  添加导航栏右侧按钮
 *
 *  @param target         事件对象
 *  @param action         事件方法
 *  @param normalImage    正常状态的Icon图片
 *  @param highlightImage 高亮状态的Icon图片
 *  @param needClear      是否需要清除已存在的barButton
 */
- (UIButton *)rt_addRightBarButtonWithTarget:(id)target
                                      action:(SEL)action
                                 normalImage:(UIImage *)normalImage
                              highlightImage:(UIImage *)highlightImage
                                   needClear:(BOOL)needClear;

/**
 *  添加导航栏右侧按钮
 *
 *  @param target         事件对象
 *  @param action         事件方法
 *  @param customView     自定义视图
 *  @param needClear      是否需要清除已存在的barButton
 */
- (UIButton *)rt_addRightBarButtonWithTarget:(id)target
                                      action:(SEL)action
                                  customView:(UIView *)customView
                                   needClear:(BOOL)needClear;

/**
 *  移除导航栏左侧的按钮
 */
- (void)rt_removeLeftBarButton;

/**
 *  移除导航栏右侧的按钮
 */
- (void)rt_removeRightBarButton;

#pragma mark - Attribute Settings

/**
 *  导航栏标题文字属性
 *  NSFontAttributeName             with an UIFont instance as the value, default Helvetica(Neue) 12
 *  NSForegroundColorAttributeName  with an UIColor instance as the value, default blackColor
 *  NSShadowAttributeName           with an NSShadow instance as the value
 */
@property (nonatomic, readonly) NSDictionary    *rt_navigationBarTitleTextAttributes;

/**
 *  导航栏Item文字属性（Normal）
 *  NSFontAttributeName             with an UIFont instance as the value, default Helvetica(Neue) 12
 *  NSForegroundColorAttributeName  with an UIColor instance as the value, default blackColor
 *  NSShadowAttributeName           with an NSShadow instance as the value
 */
@property (nonatomic, readonly) NSDictionary    *rt_navigationBarItemTextAttributes_normal;

/**
 *  导航栏Item文字属性（Highlight）
 *  NSFontAttributeName             with an UIFont instance as the value, default Helvetica(Neue) 12
 *  NSForegroundColorAttributeName  with an UIColor instance as the value, default blackColor
 *  NSShadowAttributeName           with an NSShadow instance as the value
 */
@property (nonatomic, readonly) NSDictionary    *rt_navigationBarItemTextAttributes_highlight;

/**
 *  返回按钮图片对象(Normal)
 */
- (UIImage *)rt_backButtonImage_normal;

/**
 *  返回按钮图片对象(HighLight)
 */
- (UIImage *)rt_backButtonImage_highlight;


@end
