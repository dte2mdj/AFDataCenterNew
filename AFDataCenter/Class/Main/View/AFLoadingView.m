//
//  AFLoadingView.m
//  AFDataCenter
//
//  Created by Apple on 16/1/25.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFLoadingView.h"

@implementation AFLoadingView
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.hidesWhenStopped = YES;
}
@end
