//
//  UILabel+Utilities.h
//  photo
//
//  Created by shupeng on 2019/6/26.
//  Copyright © 2019 vavapps. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Utilities)
+ (UILabel *)labelWithFontSize:(CGFloat)size textColor:(UIColor *)color;
+ (UILabel *)labelWithFontSize:(CGFloat)size textColor:(UIColor *)color text:(NSString *)text;
+ (UILabel *)labelWithFontSize:(CGFloat)size textColor:(UIColor *)color alignment:(NSTextAlignment)alignment text:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
