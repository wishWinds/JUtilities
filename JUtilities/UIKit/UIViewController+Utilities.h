//
//  UIViewController+Utilities.h
//  JUtilities
//
//  Created by shupeng on 2019/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Utilities)

- (void)addChildVC:(UIViewController *)childVC onView:(UIView *)parentView;

- (void)removeChildVC:(UIViewController *)childVC;

- (void)showAlertWhenSavedPhotoFailureByPermissionDenied;

- (void)showAlertWhenReadPhotoFailureByPermissionDenied;

- (void)showAlertWhenOpenCameraFailureByPermissionDenied;

- (void)confirmWithTitle:(nullable NSString *)title subtitle:(nullable NSString *)subtitle confirmBtnTitle:(NSString *)confirmBtnTitle block:(void (^)(void))block;
@end

NS_ASSUME_NONNULL_END
