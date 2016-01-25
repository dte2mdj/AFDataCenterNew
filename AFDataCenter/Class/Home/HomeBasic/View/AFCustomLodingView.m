//
//  AFCustomLodingView.m
//  AFDataCenter
//
//  Created by Apple on 16/1/25.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFCustomLodingView.h"

@interface AFCustomLodingView ()
/** AFLoadingView继承自UIActivityIndicatorView */
@property (nonatomic, strong) AFLoadingView *loadingView;
@end
@implementation AFCustomLodingView

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
    _loadingView = [[AFLoadingView alloc] init];
    [self addSubview:_loadingView];
    
    _loadingView.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self);
}

/**
 *  开始动画
 */
- (void)startAnimating
{
    [self.loadingView startAnimating];
}

/**
 *  停止动画
 */
- (void)stopAnimating
{
    [self.loadingView stopAnimating];
}
@end
