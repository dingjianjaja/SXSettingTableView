//
//  SXSettingSwitchItem.m
//  view
//
//  Created by chensx on 15/12/7.
//  Copyright © 2015年 chensx. All rights reserved.
//

#import "SXSettingSwitchItem.h"

@implementation SXSettingSwitchItem

+ (instancetype)itemWithTitle:(NSString *)title isOn:(BOOL)isOn{
    SXSettingSwitchItem *item = [self itemWithIcon:nil title:title];
    item.isOn = isOn;
    return item;
}

@end
