//
//  UILabel+Utilities.m
//  photo
//
//  Created by shupeng on 2019/6/26.
//  Copyright © 2019 vavapps. All rights reserved.
//

#import "UILabel+Utilities.h"

@implementation UILabel (Utilities)
+ (UILabel *)labelWithFontSize:(CGFloat)size textColor:(UIColor *)color {
    return [self labelWithFontSize:size textColor:color text:@""];
}

+ (UILabel *)labelWithFontSize:(CGFloat)size textColor:(UIColor *)color text:(NSString *)text {
    return [self labelWithFontSize:size textColor:color alignment:NSTextAlignmentCenter text:text];
}

+ (UILabel *)labelWithFontSize:(CGFloat)size textColor:(UIColor *)color alignment:(NSTextAlignment)alignment text:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = color;
    label.textAlignment = alignment;
    label.text = text;
    
    return label;
}
@end
