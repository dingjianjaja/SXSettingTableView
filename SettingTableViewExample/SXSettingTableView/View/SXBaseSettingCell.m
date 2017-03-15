//
//  QCBaseSettingCell.m
//  QCGlobalSport
//
//  Created by chensx on 16/11/10.
//  Copyright © 2016年 quancai. All rights reserved.
//

#import "SXBaseSettingCell.h"
#import "SXSettingCell.h"
#import "SXSettingCustomCell.h"
#import "SXSettingCustomItem.h"
#import "SXSettingItem.h"

@implementation SXBaseSettingCell

+ (instancetype)cellWithTableView:(UITableView *)tableView item:(SXSettingItem *)item {
    Class cellClass = [SXSettingCell class];
    if ([item isKindOfClass:[SXSettingCustomItem class]]) {
        cellClass = [SXSettingCustomCell class];
    }
    NSString *ID = NSStringFromClass(cellClass);
    SXBaseSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

/**
 * 子类重写
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"QCBaseSettingCell";
    SXBaseSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SXBaseSettingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.textLabel.textColor = [UIColor colorWithRed:77/255.0 green:77/255.0 blue:77/255.0 alpha:1];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //修改imageView左边距及大小
    CGRect frame = self.imageView.frame;
    frame.origin.x = 10;
    frame.size = CGSizeMake(23, 23);
    self.imageView.frame = frame;
    
    //修改标题的左侧距离
    if (self.imageView.image) {
        CGRect frame = self.textLabel.frame;
        frame.origin.x = 40;
        self.textLabel.frame = frame;
    }
}

#pragma mark - setter
- (void)setItem:(SXSettingItem *)item {
    _item = item;
}


@end
