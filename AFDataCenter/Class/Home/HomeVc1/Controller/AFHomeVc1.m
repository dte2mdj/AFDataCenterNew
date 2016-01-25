//
//  AFHomeVc1.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeVc1.h"

@interface AFHomeVc1 () <UITableViewDataSource>
/** 类别的名称 */
@property (nonatomic, strong) NSArray *typeNames;
@end

@implementation AFHomeVc1 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"激活";
    // 1.设置工具view上的按钮名称
    self.toolView.basicTypeNames = self.typeNames;
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.hidden = YES;
    tableView.backgroundColor = [UIColor yellowColor];
    tableView.dataSource = self;
    [self.customView addSubview:tableView];
    
    // 设置约束
    tableView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AFLog(@"%s", __func__);
    
    static NSString *ID = @"AFHomeVc1Cell";
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
- (void)toolView:(AFHomeBasicToolView *)toolView didSelectButtonFromOldType:(HomeToolViewType)oldType toNewType:(HomeToolViewType)newType
{

    [self.customView startAnimating];
    AFLog(@"old:%ld, new:%ld", (long)oldType, (long)newType);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        for (int i = 0; i < 999; i++) {
            AFLog(@"%d", i);
        }
        AFLog(@"停止");
        [self.customView stopAnimating];
    });
    
//    dispatch_queue_t queue = dispatch_queue_create("dte2mdj", NULL);
//    
//    dispatch_async(queue, ^{
//        for (int i = 0; i < 9999; i++) {
//            AFLog(@"%d", i);
//            if (i == 9999 - 1) {
//                AFLog(@"停止");
//                
//                [self.customView stopAnimating];
//            }
//        }
//    });
    
    AFLog(@"可以");
}

- (NSArray *)typeNames
{
    if (!_typeNames) {
        _typeNames = [NSArray array];
        _typeNames = @[@"日", @"周", @"月", @"年"];
    }
    return _typeNames;
}
@end
