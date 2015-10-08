//
//  RTBaseViewController.m
//  Rat
//
//  Created by lawn on 15/7/21.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTBaseViewController.h"

@interface RTBaseViewController ()

@property(nonatomic, strong, readwrite) UIView  *containView;

@end

@implementation RTBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isSupportedGoBackByGesture = YES;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //设置容器视图
    self.containView.frame = self.view.bounds;
    
    //添加手势返回
    [self addGestureBack];
    
    //设置返回按钮
    [self addBackButton];
    
}

#pragma mark - Private Methods

- (void)addGestureBack{
    
    if (_isSupportedGoBackByGesture) {
        UISwipeGestureRecognizer *sRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rt_goBackAction)];
        sRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
        [self.containView addGestureRecognizer:sRecognizer];
    }
}

- (void)addBackButton{
    
    if (self.navigationController.viewControllers.count > 1) {
        [self rt_addBackBarButton];
    }
}

#pragma mark - Getter Methods

- (UIView *)containView{
    if (RT_IS_NULL(_containView)) {
        _containView = [[UIView alloc] init];
        _containView.backgroundColor = [UIColor redColor];
        _containView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_containView];
    }
    return _containView;
}

@end
