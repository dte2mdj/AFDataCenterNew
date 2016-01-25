//
//  AFHomeVc3.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeVc3.h"

@interface AFHomeVc3 ()

@end

@implementation AFHomeVc3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单";
}

- (NSInteger)homeTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)homeTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"AFHomeVc3Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld", (long)indexPath.row];
    
    return cell;
}

/**
 *  父类方法，当切换上方工具按钮的时候调用
 *
 *  @param toolView 工具view
 *  @param oldType  老的类型
 *  @param newType  新类型
 */
- (void)toolView:(AFHomeBasicToolView *)toolView didSelectButtonFromOldType:(NSInteger)oldType toNewType:(NSInteger)newType
{
    AFLog(@"old:%ld, new:%ld", (long)oldType, (long)newType);
}
@end
