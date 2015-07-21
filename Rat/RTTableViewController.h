//
//  RTTableViewController.h
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTBaseViewController.h"

typedef NS_OPTIONS(NSUInteger, RTTableViewStyle) {
    RTTableViewStyleNone      = 0,
    RTTableViewStyleRefresh   = 1 << 0,
    RTTableViewStyleMore      = 1 << 1,
    RTTableViewStyleBoth      = 1 << 2
};

@interface RTTableViewController : RTBaseViewController<UITableViewDataSource, UITableViewDelegate>


/**
 *  设置tableview的样式
 *
 *  @param style 是否显示下拉刷新和上拉加载
 */
- (void)registerTableStyle:(RTTableViewStyle)style;

/**
 *  刷新，下拉时调用此方法
 */
- (void)refreshData;


/**
 *  加载更多，上拉时调用此方法
 */
- (void)loadMoreData;


/**
 *  关闭加载状态
 */
- (void)endLoading;

@end
