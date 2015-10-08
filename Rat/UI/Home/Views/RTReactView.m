//
//  RTReactView.m
//  Rat
//
//  Created by lawn on 15/7/23.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import "RTReactView.h"
#import "RCTRootView.h"

@implementation RTReactView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle"];
        RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                            moduleName: @"Rat"
                                                         launchOptions:nil];
        
        [self addSubview:rootView];
        rootView.frame = frame;
    }
    return self;
}
@end
