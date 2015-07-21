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

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.containView.frame = self.view.bounds;
    
    NSLog(@"=============%@", [self.containView description]);
}


#pragma mark -
#pragma mark Getter && Setter 

- (UIView *)containView{
    if (RT_IS_NULL(_containView)) {
        _containView = [[UIView alloc] init];
        _containView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_containView];
    }
    return _containView;
}

@end
