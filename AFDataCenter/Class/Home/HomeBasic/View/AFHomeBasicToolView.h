//
//  AFHomeBasicToolView.h
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AFHomeBasicToolView;

typedef enum {
    HomeToolViewTypeDay, // 日
    HomeToolViewTypeWeek, // 周
    HomeToolViewTypeMonth, // 月
    HomeToolViewTypeYear, // 年
    HomeToolViewTypeOther // 其它
}HomeToolViewType;

@protocol AFHomeBasicToolViewDelegate <NSObject>

@optional
/** 类别进行切换 */
- (void)toolView:(AFHomeBasicToolView *)toolView didSelectButtonFromOldType:(HomeToolViewType)oldType toNewType:(HomeToolViewType)newType;

@end
@interface AFHomeBasicToolView : UIView
@property (nonatomic, weak) id<AFHomeBasicToolViewDelegate> delegate;

/** 类别的名称 */
@property (nonatomic, strong) NSArray *basicTypeNames;



@end
