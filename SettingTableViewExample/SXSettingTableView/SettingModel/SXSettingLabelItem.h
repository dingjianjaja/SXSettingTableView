//
//  SXSettingLabelItem.h
//  view
//
//  Created by chensx on 15/12/7.
//  Copyright © 2015年 chensx. All rights reserved.
//

#import "SXSettingItem.h"

@interface SXSettingLabelItem : SXSettingItem

@property (nonatomic,strong)NSString *text;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title text:(NSString *)text;

@end
