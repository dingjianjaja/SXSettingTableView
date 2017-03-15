//
//  SXSettingCustomItem.h
//  QCGlobalSport
//
//  Created by chensx on 16/7/18.
//  Copyright © 2016年 quancai. All rights reserved.
//

#import "SXSettingItem.h"

//可自定义cell
typedef enum : NSInteger {
    SXSettingCustomItemTypeImage,
    SXSettingCustomItemTypeGold
} SXSettingCustomItemType;


@interface SXSettingCustomItem : SXSettingItem

@property (nonatomic,assign)SXSettingCustomItemType type;
@property (nonatomic,assign)Class destVcClass;
@property (nonatomic,copy)NSString *text;
@property (nonatomic,strong)NSString *imageUrl;
@property (nonatomic,strong)UIImage *image;


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass text:(NSString *)text type:(SXSettingCustomItemType)type;

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass type:(SXSettingCustomItemType)type;


/**
 SXSettingCustomItemTypeImage
 */
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image;
+ (instancetype)itemWithTitle:(NSString *)title imageUrl:(NSString *)imageUrl;

@end
