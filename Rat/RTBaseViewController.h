//
//  RTBaseViewController.h
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTBaseViewController : UIViewController


/**
 *  容器视图，控制器里的所有view加在containView上
 */
@property(nonatomic, strong, readonly) UIView *containView;

/**
 *  是否打开手势返回，默认打开
 */
@property(nonatomic, assign) BOOL isSupportedGoBackByGesture;


@end
