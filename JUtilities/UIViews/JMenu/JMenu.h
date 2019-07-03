//
//  JMenu.h
//  JUtilitiesDemo
//
//  Created by shupeng on 2019/6/19.
//  Copyright © 2019 shupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 2种布局方式
 1. 设定好整个宽度. 空隙自动填充
 2. 不设定宽度. 设定空隙. 宽度为内容宽度
 如果spacing > 0. 那么就是方式2
 */
@interface JMenu : UIView

// 整个menu内容的padding
@property(nonatomic, assign) UIEdgeInsets inset;

// 如果spacing > 0. 那么就是方式2
@property(nonatomic, assign) NSInteger spacing;

@property(nonatomic, strong) NSArray *titles;

@property(nonatomic, assign) NSInteger selectedIndex;

@property(nonatomic, copy) void (^jmenuDidSelectItemAtIndex)(NSInteger index);

@property(nonatomic, strong) UIColor *normalTextColor;
@property(nonatomic, strong) UIFont *normalFont;
@property(nonatomic, strong) UIColor *selectedTextColor;
@property(nonatomic, strong) UIFont *selectedFont;

@end

NS_ASSUME_NONNULL_END
