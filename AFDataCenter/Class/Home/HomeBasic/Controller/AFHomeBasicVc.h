//
//  AFHomeBasicVc.h
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"
#import "AFHomeBasicToolView.h"
#import "AFCustomLodingView.h"

@interface AFHomeBasicVc : AFViewController <AFHomeBasicToolViewDelegate>
/** 工具view */
@property (nonatomic, strong) AFHomeBasicToolView *toolView;
/** 用户自定义view */
@property (nonatomic, strong) AFCustomLodingView *customView;
@end
