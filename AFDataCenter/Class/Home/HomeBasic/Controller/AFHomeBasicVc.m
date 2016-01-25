//
//  AFHomeBasicVc.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeBasicVc.h"

@interface AFHomeBasicVc ()
/** 当前的类别 */
@property (nonatomic, assign) NSInteger currentType;

@end

@implementation AFHomeBasicVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = AFGlobalBg;
    
    // 1、设置上方工具View
    [self setupToolView];
    
    // 2、设置scrollView
    [self setupCustomerView];
}

/**
 *  设置上方工具View
 */
- (void)setupToolView
{
    // 创建上方的toolView
    _toolView = [[AFHomeBasicToolView alloc] init];
    _toolView.delegate = self;
    [self.view addSubview:_toolView];
    
    // 设计约束
    _toolView.sd_layout
    .topSpaceToView(self.view, 64)
    .rightEqualToView(self.view)
    .leftEqualToView(self.view)
    .heightIs(44);
}

/**
 *  设置customView
 */
- (void)setupCustomerView
{
    // 创建scrollView
    _customView = [[AFCustomLodingView alloc] init];
    [self.view addSubview:_customView];
    
    _customView.sd_layout
    .topSpaceToView(_toolView, 0)
    .rightEqualToView(self.view)
    .leftEqualToView(self.view)
    .bottomSpaceToView(self.tabBarController.tabBar, 1);

}


@end
