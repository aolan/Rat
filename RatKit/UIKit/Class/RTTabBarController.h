//
//  RTTabBarController.h
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTTabBarController : UITabBarController


#pragma mark - Override By SubClass

/**
 * 【子类必须实现】设置tabbar所包含的控制器
 *
 *  @return 控制器列表
 */
- (NSArray *)rt_viewControllersForTabBarController;

/**
 * 【子类可实现】设置tabbar的每个item的选中的图片
 *
 *  @return 选中状态图片链接列表
 */
- (NSArray *)rt_tabbarSelectedImageForTabBarController;


/**
 * 【子类可实现】设置tabbar的每个item的未选中的图片
 *
 *  @return 正常状态图片列表 @[UIImage,UIImage,...]
 */
- (NSArray *)rt_tabbarNormalImageForTabBarController;


/**
 *  【子类可实现】设置tabbar上的文字
 *
 *  @return tabbar上显示的文字列表
 */
- (NSArray *)rt_tabbarTitleForTabBarController;

/**
 *  【子类可实现】设置tabbar上文字的未选中时的样式
 *
 *  @return 返回样式
 */
- (NSDictionary *)rt_tabbarTitleAttributesNormal;

/**
 *  【子类可实现】设置tabbar上文字的选中时的样式
 *
 *  @return 返回样式
 */
- (NSDictionary *)rt_tabbarTitleAttributesSelected;


#pragma mark - Inteface Methods

/**
 *  获取单例
 *
 *  @return 单例
 */
+ (id)shareInstance;

/**
 *  切换tabbar
 *
 *  @param index 下标 【0,1,...】
 */
- (void)switchIndex:(NSInteger)index;


@end
