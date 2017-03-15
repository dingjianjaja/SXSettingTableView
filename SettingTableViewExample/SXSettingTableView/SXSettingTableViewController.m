//
//  SXSettingTableViewController.m
//  SettingTableViewExample
//
//  Created by chensx on 17/3/15.
//  Copyright © 2017年 customTableView. All rights reserved.
//

#import "SXSettingTableViewController.h"

@interface SXSettingTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation SXSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupSubviews];
}

- (void)setupSubviews {
    [self.view addSubview:self.tableView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SXSettingGroup *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SXSettingGroup *group = self.groups[indexPath.section];
    SXSettingItem *item = group.items[indexPath.row];
    SXBaseSettingCell *cell = [SXBaseSettingCell cellWithTableView:tableView item:item];
    cell.item = item;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SXSettingGroup *group = self.groups[indexPath.section];
    SXSettingItem *item = group.items[indexPath.row];
    
    if (item.option) {
        item.option(item);
        return;
        
    }
    
    UIViewController *vc;
    if ([item isKindOfClass:[SXSettingArrowItem class]]) {
        
        SXSettingArrowItem *arrowItem = (SXSettingArrowItem *)item;
        if (arrowItem.destVcClass == nil) return;
        
        vc = [[arrowItem.destVcClass alloc] init];
        vc.title = arrowItem.title;
        
    }else if ([item isKindOfClass:[SXSettingCustomItem class]]) {
        
        SXSettingCustomItem *arrowItem = (SXSettingCustomItem *)item;
        if (arrowItem.destVcClass == nil) return;
        
        vc = [[arrowItem.destVcClass alloc] init];
        vc.title = arrowItem.title;
    }else {
        return;
    }
    
    if (self.navigationController) {
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SXSettingGroup *group = self.groups[indexPath.section];
    SXSettingItem *item = group.items[indexPath.row];
    return item.rowHeight;
}

//重写分隔线
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 10;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1.0];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.001)];
    }
    return _tableView;
}

- (NSMutableArray *)groups {
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}




@end
