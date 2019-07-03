//
//  UIStackView+Utilities.h
//  photo
//
//  Created by shupeng on 2019/6/26.
//  Copyright © 2019 vavapps. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIStackView (Utilities)
// 自动填充的宽高布局
+ (UIStackView *)stackViewWithAxis:(UILayoutConstraintAxis)axis subviews:(NSArray<UIView *> *)subviews spacing:(CGFloat)spacing;
@end

NS_ASSUME_NONNULL_END
