//
//  SXSettingCustomCell.m
//  QCGlobalSport
//
//  Created by chensx on 16/7/18.
//  Copyright © 2016年 quancai. All rights reserved.
//

#import "SXSettingCustomCell.h"
#import "SXSettingCustomItem.h"
#import "SXSettingItem.h"

@interface SXSettingCustomCell()

@property (nonatomic,strong)UIView *goldView;
@property (nonatomic,strong)UIView *rightImageView;

@end

@implementation SXSettingCustomCell



#pragma mark - setter
- (void)setItem:(SXSettingItem *)item{
    [super setItem:item];
    [self setupData];
    
}

/**
 *  设置右边的内容
 */
- (void)setupData{
    
    self.textLabel.text = self.item.title;
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    
    if (![self.item isKindOfClass:[SXSettingCustomItem class]]) {
        return;
    }
    
    SXSettingCustomItem *item = (SXSettingCustomItem *)self.item;
    if (item.type == SXSettingCustomItemTypeGold) {
        self.accessoryView = self.goldView;
        UILabel *label = [self.goldView.subviews lastObject];
        label.text = item.text;
        
    }else if (item.type == SXSettingCustomItemTypeImage) {
        self.accessoryView = self.rightImageView;
        UIImageView *imageView = self.rightImageView.subviews.lastObject;
        if (item.image) {
            imageView.image = item.image;
            
        }else {
        }
    }
}



#pragma mark - getter
/**
 *  右侧图片
 */
- (UIView *)rightImageView{
    if (!_rightImageView) {
        CGFloat imageW2 = 44;
        _rightImageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageW2, imageW2)];
        
        //自定义图片
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageW2, imageW2)];
        imageV.layer.cornerRadius = imageW2/2.0;
        imageV.layer.masksToBounds = YES;
        [_rightImageView addSubview:imageV];
    }
    return _rightImageView;
}


/**
 *  带箭头文字
 */
- (UIView *)goldView{
    if (!_goldView) {
        CGFloat width = ScreenWidth/3.0;
        _goldView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, SettingRowHeight)];
        
        //箭头
        CGFloat imageW = 11;
        UIImageView *arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(width-imageW, SettingRowHeight/2 - imageW/2, imageW, imageW)];
        arrowView.image = [UIImage imageNamed:@"CellArrow"];
        [_goldView addSubview:arrowView];
        
        CGFloat padding = 4;
        
        //金币
        CGFloat imageW2 = 16;
        CGFloat goldX = arrowView.frame.origin.y - imageW2 - padding;
        UIImageView *goldImage = [[UIImageView alloc] initWithFrame:CGRectMake(goldX, SettingRowHeight/2 - imageW2/2, imageW2, imageW2)];
        goldImage.image = [UIImage imageNamed:@"ic_myquiz_gold"];
        [_goldView addSubview:goldImage];
        
        //文字
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, goldImage.frame.origin.x - padding, SettingRowHeight)];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = SXSettingTextColor;
        label.font = SXSettingTextFont;
        [_goldView addSubview:label];
    }
    return _goldView;
}




@end
