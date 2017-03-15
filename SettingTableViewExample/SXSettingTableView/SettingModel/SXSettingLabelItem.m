//
//  SXSettingLabelItem.m
//  view
//
//  Created by chensx on 15/12/7.
//  Copyright © 2015年 chensx. All rights reserved.
//

#import "SXSettingLabelItem.h"

@implementation SXSettingLabelItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title text:(NSString *)text{
    SXSettingLabelItem *item = [self itemWithIcon:icon title:title];
    item.text = text;
    return item;
}

@end
