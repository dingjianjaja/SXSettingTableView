//
//  SXSettingItem.m
//  view
//
//  Created by chensx on 15/12/7.
//  Copyright © 2015年 chensx. All rights reserved.
//

#import "SXSettingItem.h"

@implementation SXSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title{
    SXSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title{
    return [self itemWithIcon:nil title:title];
}

- (CGFloat)rowHeight {
    if (_rowHeight == 0) {
        return SettingRowHeight;
    }
    return _rowHeight;
}

@end
