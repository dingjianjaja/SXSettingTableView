//
//  SXSettingArrowItem.h
//  view
//
//  Created by chensx on 15/12/7.
//  Copyright © 2015年 chensx. All rights reserved.
//

#import "SXSettingItem.h"

@interface SXSettingArrowItem : SXSettingItem

/**
 右侧文字描述
 */
@property (nonatomic,strong)NSString *text;

/**
 点击跳转的viewController
 */
@property (nonatomic,assign)Class destVcClass;


+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon  title:(NSString *)title text:(NSString *)text destVcClass:(Class)destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title text:(NSString *)text destVcClass:(Class)destVcClass;

@end
