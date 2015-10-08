//
//  UIViewController+RTActivityView.m
//  Rat
//
//  Created by lawn on 15/9/30.
//  Copyright © 2015年 zodiac. All rights reserved.
//

#import "UIViewController+RTActivityView.h"

static char RT_PROGRESS_HUD_CUSTOM;
static char RT_PROGRESS_HUD_TEXT;

@implementation UIViewController (RTActivityView)

#pragma mark - 加载框

- (void)showActivityView{
    [self showActivityViewWithShowTime:RTActivityViewShowTimeNormal];
}

- (void)showActivityViewWithShowTime:(RTActivityViewShowTime)showTime{
    [self showActivityViewWithMessage:nil showTime:showTime];
}

- (void)showActivityViewWithMessage:(NSString *)message{
    [self showActivityViewWithMessage:message showTime:RTActivityViewShowTimeNormal];
}

- (void)showActivityViewWithMessage:(NSString *)message showTime:(RTActivityViewShowTime)showTime{
    
    int timeDelay = 20;
    if (showTime == RTActivityViewShowTimeShort) {
        timeDelay = 10;
    }else if (showTime == RTActivityViewShowTimeLong){
        timeDelay = 60;
    }else{
        timeDelay = 20;
    }
    
    MBProgressHUD *hud = [self getProgessHUD];
    hud.detailsLabelText = message;
    [hud show:YES];
    
    [hud hide:YES afterDelay:timeDelay];
}

- (void)hideActivityView{
    
    [self hideActivityViewAfterComplete:NULL];
}

- (void)hideActivityViewAfterComplete:(void (^)())completeBlock{
    
    MBProgressHUD *hud = [self getProgessHUD];
    hud.completionBlock = completeBlock;
    [hud hide:YES];
}

#pragma mark - 提示框

- (void)showToastViewWithMessage:(NSString *)message{
    
    [self showToastViewWithMessage:message afterComplete:NULL];
}

- (void)showToastViewWithMessage:(NSString *)message afterComplete:(void (^)())completeBlock{
    
    MBProgressHUD *toast = [self getToastHUD];
    toast.detailsLabelText = message;
    toast.completionBlock = completeBlock;
    [toast show:YES];
    
    [toast hide:YES afterDelay:2.0f];
}

#pragma mark - 确认框

- (void)showAlertViewWithMessage:(NSString *)message
                    cancelButton:(NSString *)cancelButton
                   afterComplete:(void(^)())completeBlock{
    
    [self showAlertViewWithTitle:nil message:message cancelButton:cancelButton otherButton:nil afterComplete:^(NSInteger buttonIndex) {
        if (completeBlock) {
            completeBlock();
        }
    }];
}

- (void)showAlertViewWithMessage:(NSString *)message
                    cancelButton:(NSString *)cancelButton
                     otherButton:(NSString *)otherButton
                   afterComplete:(void (^)(NSInteger buttonIndex))completeBlock{
    
    [self showAlertViewWithTitle:nil message:message cancelButton:cancelButton otherButton:otherButton afterComplete:^(NSInteger buttonIndex) {
        if (completeBlock) {
            completeBlock(buttonIndex);
        }
    }];
}

- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                  cancelButton:(NSString *)cancelButton
                 afterComplete:(void (^)())completeBlock{
   
    [self showAlertViewWithTitle:title message:message cancelButton:cancelButton otherButton:nil afterComplete:^(NSInteger buttonIndex) {
        if (completeBlock) {
            completeBlock();
        }
    }];
}

- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                  cancelButton:(NSString *)cancelButton
                   otherButton:(NSString *)otherButton
                 afterComplete:(void (^)(NSInteger buttonIndex))completeBlock{
    
    if (otherButton) {
        [self showAlertViewWithTitle:title message:message cancelButton:cancelButton otherButtons:@[otherButton] afterComplete:^(NSInteger buttonIndex) {
            if (completeBlock) {
                completeBlock(buttonIndex);
            }
        }];
    }else{
        [self showAlertViewWithTitle:title message:message cancelButton:cancelButton otherButtons:nil afterComplete:^(NSInteger buttonIndex) {
            if (completeBlock) {
                completeBlock(buttonIndex);
            }
        }];
    }
    
}

- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                  cancelButton:(NSString *)cancelButton
                  otherButtons:(NSArray *)otherButtons
                 afterComplete:(void (^)(NSInteger buttonIndex))completeBlock{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                              cancelButtonTitle:cancelButton
                                              otherButtonTitles:otherButtons];
    
    [alertView showUsingBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if (completeBlock) {
            completeBlock(buttonIndex);
        }
    }];
}

#pragma mark - Private Methods

- (MBProgressHUD *)getProgessHUD{
    
    MBProgressHUD *hud = objc_getAssociatedObject(self, &RT_PROGRESS_HUD_CUSTOM);
    
    if (RT_IS_NULL(hud)) {
        
        UIImage *loadingImage = RT_IMAGE(@"rt_loading_icon");
        UIImageView *customView = [[UIImageView alloc] initWithImage:RT_IMAGE(@"rt_loading_icon")];
        customView.frame = CGRectMake(0, 0, loadingImage.size.width, loadingImage.size.height);
        
        CABasicAnimation *animate = [CABasicAnimation rotationWithDegree:360 inDirection:1 withDuring:0.8 repeatTime:INFINITY];
        [customView.layer addAnimation:animate forKey:nil];
        
        hud = [[MBProgressHUD alloc] initWithView:self.view];
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = customView;
        hud.removeFromSuperViewOnHide = YES;
        [self.view addSubview:hud];
        
        objc_setAssociatedObject(self, &RT_PROGRESS_HUD_CUSTOM, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return hud;
}

- (MBProgressHUD *)getToastHUD{
    
    MBProgressHUD *hud = objc_getAssociatedObject(self, &RT_PROGRESS_HUD_TEXT);
    
    if (RT_IS_NULL(hud)) {
        
        hud = [[MBProgressHUD alloc] initWithView:self.view];
        hud.mode = MBProgressHUDModeText;
        hud.removeFromSuperViewOnHide = YES;
        [self.view addSubview:hud];
        
        objc_setAssociatedObject(self, &RT_PROGRESS_HUD_TEXT, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return hud;
}
@end
