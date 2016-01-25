//
//  AFHomeBasicToolView.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeBasicToolView.h"

@interface AFHomeBasicToolView ()
@property (nonatomic, strong) UIButton *currentBtn;
@property (nonatomic, strong) NSMutableArray *btns;
/** view下方红色线 */
@property (nonatomic, strong) UIView *lineView;
@end
@implementation AFHomeBasicToolView

- (void)setBasicTypeNames:(NSArray *)basicTypeNames
{
    _basicTypeNames = basicTypeNames;
    
    NSUInteger count = basicTypeNames.count;
    CGFloat btnW = SCW / count;
    CGFloat btnH = 44;
    CGFloat btnY = 0;
    AFLog(@"%f", btnW);
    for (int i = 0; i < count; i++) {
        CGFloat btnX = i * btnW;
        
        UIButton *btn = [[UIButton alloc] init];
        [self.btns addObject:btn];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setTitle:basicTypeNames[i] forState:UIControlStateNormal];
        [btn setTitleColor:AFColor(73, 73, 73) forState:UIControlStateNormal];
        [btn setTitleColor:AFColor(255, 0, 0) forState:UIControlStateDisabled];
        btn.backgroundColor = AFColor(arc4random() % 256, arc4random() % 256, arc4random() % 256);
        btn.tag = i;
        [btn addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        if (i == 0) {
            [self changeDate:btn];
        }
    }
    
    _lineView = [[UIView alloc] init];
    _lineView.frame = CGRectMake(0, btnH - 1, btnW, 1);
    _lineView.backgroundColor = AFCutomerColor_red;
    [self addSubview:_lineView];
}

- (HomeToolViewType)getToolViewTypeWithIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            return HomeToolViewTypeDay;
            break;
        case 1:
            return HomeToolViewTypeWeek;
            break;
        case 2:
            return HomeToolViewTypeMonth;
            break;
        case 3:
            return HomeToolViewTypeYear;
            break;
        default:
            return HomeToolViewTypeOther;
            break;
    }
}

- (void)changeDate:(UIButton *)btn
{
    // 0.转换成对应的枚举
    HomeToolViewType oldType = [self getToolViewTypeWithIndex:_currentBtn.tag];
    HomeToolViewType newType = [self getToolViewTypeWithIndex:btn.tag];
    
    // 1、使用代理方法
    if ([self.delegate respondsToSelector:@selector(toolView:didSelectButtonFromOldType:toNewType:)]) {
        [self.delegate toolView:self didSelectButtonFromOldType:oldType toNewType:newType];
    }
    
    // 2.将当前按钮状态设为可用
    _currentBtn.enabled = YES;
    
    // 3.将切换后的按钮设为禁用
    btn.enabled = NO;
    
    // 4.将切换后的按钮保存成当前按钮
    _currentBtn = btn;
    
    // 5.改变toolView正文红色线的位置
    [UIView animateWithDuration:0.3 animations:^{
        _lineView.transform = CGAffineTransformMakeTranslation(_currentBtn.origin.x, 0);
    }];
}


@end
