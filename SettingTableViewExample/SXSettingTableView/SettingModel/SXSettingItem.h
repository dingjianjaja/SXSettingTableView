//
//  SXSettingItem.h
//  view
//
//  Created by chensx on 15/12/7.
//  Copyright © 2015年 chensx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SXSettingItem;

#define ScreenWidth      [UIScreen mainScreen].bounds.size.width
#define SettingRowHeight 44.0

//右侧文字描述
#define SXSettingTextFont    [UIFont systemFontOfSize:12]
#define SXSettingTextColor   [UIColor colorWithRed:112/255.0 green:112/255.0 blue:112/255.0 alpha:1]

typedef void (^SXSettingItemOption)(SXSettingItem *);

@interface SXSettingItem : NSObject

/**
 左侧图标
 */
@property (nonatomic,copy)NSString *icon;

/**
 标题
 */
@property (nonatomic,copy)NSString *title;

/**
 row高度，默认44.0
 */
@property (nonatomic,assign)CGFloat rowHeight;

/**
 点击实现的方法
 */
@property (nonatomic,copy)SXSettingItemOption option;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;

@end
