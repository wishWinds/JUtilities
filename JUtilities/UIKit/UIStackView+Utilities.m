//
//  UIStackView+Utilities.m
//  photo
//
//  Created by shupeng on 2019/6/26.
//  Copyright © 2019 vavapps. All rights reserved.
//

#import "UIStackView+Utilities.h"

@implementation UIStackView (Utilities)
+ (UIStackView *)stackViewWithAxis:(UILayoutConstraintAxis)axis subviews:(NSArray<UIView *> *)subviews spacing:(CGFloat)spacing {
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:subviews];
    stackView.axis = axis;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = spacing;
    
    return stackView;
}
@end
