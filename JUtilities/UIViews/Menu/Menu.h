//
//  Menu.h
//  inJapan
//
//  Created by shupeng on 2018/8/19.
//  Copyright © 2018年 shupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Menu : UIView


/**
 整个menu内容的padding
 */
@property(nonatomic, assign) UIEdgeInsets inset;

/**
 item之间的间距, 如果是autoSpacing则会忽略该值
 */
@property(nonatomic, assign) NSInteger spacing;

/**
 如果是自适应间距, 则会忽略spacing值.
 否则, 当内容大于父容器宽度时, 会进行横向滑动
 */
@property(nonatomic, assign) BOOL autoSpacing;


/**
 字符串数组

 @param items 字符串数组
 */
- (void)configWithItems:(NSArray *)items;


/**
 当前的index
 */
@property(nonatomic, assign) NSInteger currentIndex;


/**
 回调
 */
@property(nonatomic, copy) void (^menuDidSelectAtIndex)(NSInteger index);

@end
