//
//  SXSettingArrowItem.m
//  view
//
//  Created by chensx on 15/12/7.
//  Copyright © 2015年 chensx. All rights reserved.
//

#import "SXSettingArrowItem.h"

@implementation SXSettingArrowItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title text:(NSString *)text destVcClass:(Class)destVcClass {
    SXSettingArrowItem *item = [self itemWithIcon:icon title:title destVcClass:destVcClass];
    item.destVcClass = destVcClass;
    item.text = text;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title text:(NSString *)text destVcClass:(Class)destVcClass {
    SXSettingArrowItem *item = [self itemWithIcon:nil title:title destVcClass:destVcClass];
    item.destVcClass = destVcClass;
    item.text = text;
    return item;
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass{
    SXSettingArrowItem *item = [self itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass{
    return [self itemWithIcon:nil title:title destVcClass:destVcClass];
}

@end
