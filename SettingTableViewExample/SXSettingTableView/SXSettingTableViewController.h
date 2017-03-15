//
//  SXSettingTableViewController.h
//  SettingTableViewExample
//
//  Created by chensx on 17/3/15.
//  Copyright © 2017年 customTableView. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXSettingView.h"

@interface SXSettingTableViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *groups;

@end
