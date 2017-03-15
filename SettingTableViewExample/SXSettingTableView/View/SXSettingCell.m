//
//  SXSettingCell.m
//  view
//
//  Created by chensx on 15/12/7.
//  Copyright © 2015年 chensx. All rights reserved.
//

#import "SXSettingCell.h"
#import "SXSettingItem.h"
#import "SXSettingSwitchItem.h"
#import "SXSettingArrowItem.h"
#import "SXSettingLabelItem.h"
@interface SXSettingCell()
/**
 *  箭头
 */
@property (nonatomic, strong) UIImageView *arrowView;
/**
 *  开关
 */
@property (nonatomic, strong) UISwitch *switchView;
/**
 *  标签
 */
@property (nonatomic, strong) UILabel *labelView;
/**
 *  带箭头文字
 */
@property (nonatomic,strong)UIView *textView;
/**
 *  图片
 */
@property (nonatomic,strong)UIView *rightImageView;

@end

@implementation SXSettingCell


#pragma mark - action
- (void)switchDidChange:(UISwitch *)mySwitch{
    SXSettingSwitchItem *item = (SXSettingSwitchItem *)self.item;
    if (item.switchOption) {
        item.switchOption(mySwitch);
    }
}

#pragma mark - setter
- (void)setItem:(SXSettingItem *)item{
    [super setItem:item];
    
    // 1.设置数据
    [self setupData];
    
    // 2.设置右边的内容
    [self setupRightContent];
}

/**
 *  设置右边的内容
 */
- (void)setupRightContent{
    if ([self.item isKindOfClass:[SXSettingArrowItem class]]) { // 箭头
        SXSettingArrowItem *item = (SXSettingArrowItem *)self.item;
        if (item.text) {
            self.accessoryView = self.textView;
            UILabel *label = [self.textView.subviews lastObject];
            label.text = item.text;
            
        }else{
            self.accessoryView = self.arrowView;
        }
        
    } else if ([self.item isKindOfClass:[SXSettingSwitchItem class]]) { // 开关
        SXSettingSwitchItem *item = (SXSettingSwitchItem *)self.item;
        self.switchView.on = item.isOn;
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else if ([self.item isKindOfClass:[SXSettingLabelItem class]]) { // 标签
        SXSettingLabelItem *item = (SXSettingLabelItem *)self.item;
        self.labelView.text = item.text;
        self.accessoryView = self.labelView;
        
    }else {
        self.accessoryView = nil;
    }
}


/**
 *  设置数据
 */
- (void)setupData{
    
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
}

#pragma mark - getter

/**
 *  带箭头文字
 */
- (UIView *)textView{
    if (!_textView) {
        CGFloat width = ScreenWidth/3.0;
        _textView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, SettingRowHeight)];
        
        //箭头
        CGFloat imageW = 11;
        UIImageView *arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(width-imageW, SettingRowHeight/2 - imageW/2, imageW, imageW)];
        arrowView.image = [UIImage imageNamed:@"CellArrow"];
        [_textView addSubview:arrowView];
        
        //文字
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width-imageW-4, SettingRowHeight)];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = SXSettingTextColor;
        label.font = SXSettingTextFont;
        [_textView addSubview:label];
    }
    return _textView;
}

/**
 *  箭头
 */
- (UIImageView *)arrowView{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}

/**
 *  开关
 */
- (UISwitch *)switchView{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(switchDidChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

/**
 *  文字
 */
- (UILabel *)labelView{
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] init];
        _labelView.bounds = CGRectMake(0, 0, 160, SettingRowHeight);
        _labelView.textAlignment = NSTextAlignmentRight;
        _labelView.font = SXSettingTextFont;
        _labelView.textColor = SXSettingTextColor;
    }
    return _labelView;
}




@end
