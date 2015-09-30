//
//  UIViewController+RTNavigationBar.m
//  Rat
//
//  Created by lawn on 15/9/29.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import "UIViewController+RTNavigationBar.h"

/**
 *  导航栏Item类型
 */
typedef NS_ENUM(NSUInteger, RTNavigationBarItemType) {
    /**
     *  左
     */
    RTNavigationBarItemType_Left = 0,
    /**
     *  标题
     */
    RTNavigationBarItemType_Title,
    /**
     *  右
     */
    RTNavigationBarItemType_Right
};


@implementation UIViewController (RTNavigationBar)

#pragma mark - Actions

- (void)rt_goBackAction{
    UIViewController *ctrl = [self.navigationController popViewControllerAnimated:YES];
    if (ctrl == nil) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (void)rt_goHomeAction{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - View Settings

- (void)rt_setTitleWithView:(UIView *)titleView{
    
    self.navigationItem.titleView = titleView;
}

- (UIButton *)rt_addBackBarButton{
    
    return [self rt_addLeftBarButtonWithTarget:self
                                        action:@selector(rt_goBackAction)
                                   normalImage:self.rt_backButtonImage_normal
                                highlightImage:self.rt_backButtonImage_highlight
                                     needClear:YES];
}

- (UIButton *)rt_addLeftBarButtonWithTarget:(id)target
                                     action:(SEL)action
                                      title:(NSString *)title
                                  needClear:(BOOL)needClear{
    
    return [self rt_addBarButtonWithType:RTNavigationBarItemType_Left
                                  target:target
                                  action:action
                                   title:title
                               needClear:needClear];
}

- (UIButton *)rt_addLeftBarButtonWithTarget:(id)target
                                     action:(SEL)action
                                normalImage:(UIImage *)normalImage
                             highlightImage:(UIImage *)highlightImage
                                  needClear:(BOOL)needClear{
    
    return [self rt_addBarButtonWithType:RTNavigationBarItemType_Left
                                  target:target
                                  action:action
                             normalImage:normalImage
                        highlightedImage:highlightImage
                               needClear:needClear];

}

- (UIButton *)rt_addLeftBarButtonWithTarget:(id)target
                                     action:(SEL)action
                                 customView:(UIView *)customView
                                  needClear:(BOOL)needClear{
   
    return [self rt_addBarButtonWithType:RTNavigationBarItemType_Left
                                  target:target
                                  action:action
                              customView:customView
                              needsClear:needClear];
}

- (UIButton *)rt_addRightBarButtonWithTarget:(id)target
                                      action:(SEL)action
                                       title:(NSString *)title
                                   needClear:(BOOL)needClear{
    
    return [self rt_addBarButtonWithType:RTNavigationBarItemType_Right
                                  target:target
                                  action:action
                                   title:title
                               needClear:needClear];
}

- (UIButton *)rt_addRightBarButtonWithTarget:(id)target
                                      action:(SEL)action
                                 normalImage:(UIImage *)normalImage
                              highlightImage:(UIImage *)highlightImage
                                   needClear:(BOOL)needClear{
    
    return [self rt_addBarButtonWithType:RTNavigationBarItemType_Right
                                  target:target
                                  action:action
                             normalImage:normalImage
                        highlightedImage:highlightImage
                               needClear:needClear];
}

- (UIButton *)rt_addRightBarButtonWithTarget:(id)target
                                      action:(SEL)action
                                  customView:(UIView *)customView
                                   needClear:(BOOL)needClear{
    
    return  [self rt_addBarButtonWithType:RTNavigationBarItemType_Right
                                   target:target
                                   action:action
                               customView:customView
                               needsClear:needClear];
}

- (void)rt_removeLeftBarButton{
   self.navigationItem.leftBarButtonItems = @[];
}

- (void)rt_removeRightBarButton{
   self.navigationItem.rightBarButtonItems = @[];
}

#pragma mark - Attribute Settings

- (NSDictionary *)rt_navigationBarTitleTextAttributes{
    
    return [NSDictionary rt_textAttributesWithFont:[UIFont boldSystemFontOfSize:18]
                                             color:[UIColor blackColor]
                                            shadow:nil];
}

- (NSDictionary *)rt_navigationBarItemTextAttributes_normal{
    
    return [NSDictionary rt_textAttributesWithFont:[UIFont systemFontOfSize:16]
                                             color:[UIColor blackColor]
                                            shadow:nil];
}

- (NSDictionary *)rt_navigationBarItemTextAttributes_highlight{
    
    return [NSDictionary rt_textAttributesWithFont:[UIFont systemFontOfSize:16]
                                             color:[UIColor grayColor]
                                            shadow:nil];
}

- (UIImage *)rt_backButtonImage_normal{
    return RT_IMAGE(@"rt_back_icon");
}

- (UIImage *)rt_backButtonImage_highlight{
    
    return [RT_IMAGE(@"rt_back_icon") rt_imageWithTintColor:[UIColor whiteColor]];
}

#pragma mark - Private Methods

- (UIButton *)rt_addBarButtonWithType:(RTNavigationBarItemType)type
                               target:(id)target
                               action:(SEL)action
                                title:(NSString *)title
                            needClear:(BOOL)needClear {
    
    UIFont *titleFont = self.rt_navigationBarItemTextAttributes_normal[NSFontAttributeName];
    UIColor *normalTitleColor = self.rt_navigationBarItemTextAttributes_normal[NSForegroundColorAttributeName];
    UIColor *highlightTitleColor = self.rt_navigationBarItemTextAttributes_highlight[NSForegroundColorAttributeName];
    
    CGSize size = [title boundingRectWithSize:CGSizeMake(120, self.navigationController.navigationBar.height)
                                      options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName: titleFont}
                                      context:nil].size;
    
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, size.width + 10.0f, self.navigationController.navigationBar.height);
    button.titleLabel.font = titleFont;
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitleColor:highlightTitleColor forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self rt_addBarButtonItem:barButtonItem type:type needClear:needClear];
    
    return button;
}

- (UIButton *)rt_addBarButtonWithType:(RTNavigationBarItemType)type
                               target:(id)target
                               action:(SEL)action
                          normalImage:(UIImage *)normalImage
                     highlightedImage:(UIImage *)highlightedImage
                            needClear:(BOOL)needClear {
    
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, normalImage.size.width + 10.0f, self.navigationController.navigationBar.height);
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self rt_addBarButtonItem:barButtonItem type:type needClear:needClear];
    
    return button;
}

- (UIButton *)rt_addBarButtonWithType:(RTNavigationBarItemType)type
                               target:(id)target
                               action:(SEL)action
                           customView:(UIView *)customView
                           needsClear:(BOOL)needsClear {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = customView.bounds;
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    customView.frame = customView.bounds;
    [button addSubview:customView];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self rt_addBarButtonItem:barButtonItem type:type needClear:needsClear];
    
    return button;
}

- (void)rt_addBarButtonItem:(UIBarButtonItem *)barButtonItem
                       type:(RTNavigationBarItemType)type
                  needClear:(BOOL)needClear {
    
    if (type == RTNavigationBarItemType_Left) {
        
        if (needClear) {
            [self rt_removeLeftBarButton];
        }
        
        NSMutableArray *leftBarButtonItems = [NSMutableArray arrayWithArray:self.navigationItem.leftBarButtonItems];
        
        if (leftBarButtonItems.count == 0) {
            UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                            target:nil
                                                                                            action:nil];
            negativeSpacer.width = -10;
            [leftBarButtonItems addObject:negativeSpacer];
        }
        
        [leftBarButtonItems addObject:barButtonItem];
        self.navigationItem.leftBarButtonItems = leftBarButtonItems;
        
    }else if (type == RTNavigationBarItemType_Right) {
        
        if (needClear) {
            [self rt_removeRightBarButton];
        }
        
        NSMutableArray *rightBarButtonItems = [NSMutableArray arrayWithArray:self.navigationItem.rightBarButtonItems];
       
        if (rightBarButtonItems.count == 0) {
            UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                            target:nil
                                                                                            action:nil];
            negativeSpacer.width = -10;
            [rightBarButtonItems addObject:negativeSpacer];
        }
        
        [rightBarButtonItems addObject:barButtonItem];
        self.navigationItem.rightBarButtonItems = rightBarButtonItems;
        
    }else{
        //do nothing
    }
}

@end
