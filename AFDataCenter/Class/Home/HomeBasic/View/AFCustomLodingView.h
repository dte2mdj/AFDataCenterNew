//
//  AFCustomLodingView.h
//  AFDataCenter
//
//  Created by Apple on 16/1/25.
//  Copyright © 2016年 AoFeng. All rights reserved.
//  加载数据的view

#import <UIKit/UIKit.h>
#import "AFLoadingView.h"

@interface AFCustomLodingView : UIView
/**
 *  开始动画
 */
- (void)startAnimating;
/**
 *  停止动画
 */
- (void)stopAnimating;
@end
