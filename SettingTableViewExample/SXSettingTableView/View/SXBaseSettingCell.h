//
//  QCBaseSettingCell.h
//  QCGlobalSport
//
//  Created by chensx on 16/11/10.
//  Copyright © 2016年 quancai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SXSettingItem;

@interface SXBaseSettingCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView item:(SXSettingItem *)item;

@property (nonatomic,retain)SXSettingItem *item;

@end
