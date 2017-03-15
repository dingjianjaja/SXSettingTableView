//
//  SXSettingSwitchItem.h
//  view
//
//  Created by chensx on 15/12/7.
//  Copyright © 2015年 chensx. All rights reserved.
//

#import "SXSettingItem.h"
#import <UIKit/UIKit.h>

typedef void (^SXSettingSwitchItemOption)(UISwitch *);


@interface SXSettingSwitchItem : SXSettingItem

/**
 YES: 开关打开； NO: 开关关闭
 */
@property (nonatomic,assign)BOOL isOn;

/**
 开关触发的方法
 */
@property (nonatomic,copy)SXSettingSwitchItemOption switchOption;

+ (instancetype)itemWithTitle:(NSString *)title isOn:(BOOL)isOn;

@end
