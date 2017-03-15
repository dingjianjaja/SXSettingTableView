//
//  SXSettingCustomItem.m
//  QCGlobalSport
//
//  Created by chensx on 16/7/18.
//  Copyright © 2016年 quancai. All rights reserved.
//

#import "SXSettingCustomItem.h"

@implementation SXSettingCustomItem

+ (instancetype)itemWithTitle:(NSString *)title imageUrl:(NSString *)imageUrl {
    SXSettingCustomItem *item = [self itemWithIcon:nil title:title];
    item.type = SXSettingCustomItemTypeImage;
    item.imageUrl = imageUrl;
    item.type = SXSettingCustomItemTypeImage;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image {
    SXSettingCustomItem *item = [self itemWithIcon:nil title:title];
    item.type = SXSettingCustomItemTypeImage;
    item.image = image;
    item.type = SXSettingCustomItemTypeImage;
    return item;
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass text:(NSString *)text type:(SXSettingCustomItemType)type{
    SXSettingCustomItem *item = [self itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    item.type = type;
    item.text = text;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass type:(SXSettingCustomItemType)type{
    SXSettingCustomItem *item = [self itemWithIcon:nil title:title];
    item.destVcClass = destVcClass;
    item.type = type;
    return item;
}

@end
