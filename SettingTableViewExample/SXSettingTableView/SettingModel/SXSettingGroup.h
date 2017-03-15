//
//  SXSettingGroup.h
//  view
//
//  Created by chensx on 15/12/7.
//  Copyright © 2015年 chensx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXSettingGroup : NSObject
/**
 *  头部标题
 */
@property (nonatomic, copy) NSString *header;
/**
 *  尾部标题
 */
@property (nonatomic, copy) NSString *footer;
/**
 *  存放着这组所有行的模型数据(这个数组中都是SXSettingItem对象)
 */
@property (nonatomic, copy) NSArray *items;

@end
