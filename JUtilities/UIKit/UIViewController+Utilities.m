//
//  UIViewController+Utilities.m
//  JUtilities
//
//  Created by shupeng on 2019/5/30.
//

#import "UIViewController+Utilities.h"
#import "Masonry.h"
#import <QMUIKit/QMUIKit.h>

@implementation UIViewController (Utilities)

- (void)addChildVC:(UIViewController *)childVC onView:(UIView *)parentView {
    [self addChildViewController:childVC];
    [parentView addSubview:childVC.view];
    [childVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(parentView);
    }];
    [childVC didMoveToParentViewController:self];
}

- (void)removeChildVC:(UIViewController *)childVC {
    [childVC willMoveToParentViewController:nil];
    [childVC.view removeFromSuperview];
    [childVC removeFromParentViewController];
}

- (void)showAlertWhenSavedPhotoFailureByPermissionDenied {
    NSString *tipString = nil;
    NSDictionary *mainInfoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [mainInfoDictionary objectForKey:@"CFBundleDisplayName"];
    if (!appName) {
        appName = [mainInfoDictionary objectForKey:(NSString *)kCFBundleNameKey];
    }
    tipString = [NSString stringWithFormat:@"请在设备的\"设置-隐私-照片\"选项中，允许%@访问你的手机相册", appName];
    
    QMUIAlertController *alertController = [QMUIAlertController alertControllerWithTitle:@"无法保存" message:tipString preferredStyle:QMUIAlertControllerStyleAlert];
    
    QMUIAlertAction *okAction = [QMUIAlertAction actionWithTitle:@"我知道了" style:QMUIAlertActionStyleCancel handler:nil];
    [alertController addAction:okAction];
    
    [alertController showWithAnimated:YES];
}

- (void)showAlertWhenReadPhotoFailureByPermissionDenied {
    NSString *tipString = nil;
    NSDictionary *mainInfoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [mainInfoDictionary objectForKey:@"CFBundleDisplayName"];
    if (!appName) {
        appName = [mainInfoDictionary objectForKey:(NSString *)kCFBundleNameKey];
    }
    tipString = [NSString stringWithFormat:@"请在设备的\"设置-隐私-照片\"选项中，允许%@访问你的手机相册", appName];
    
    QMUIAlertController *alertController = [QMUIAlertController alertControllerWithTitle:@"无法读取" message:tipString preferredStyle:QMUIAlertControllerStyleAlert];
    
    QMUIAlertAction *okAction = [QMUIAlertAction actionWithTitle:@"我知道了" style:QMUIAlertActionStyleCancel handler:nil];
    [alertController addAction:okAction];
    
    [alertController showWithAnimated:YES];
}

- (void)showAlertWhenOpenCameraFailureByPermissionDenied {
    NSString *tipString = nil;
    NSDictionary *mainInfoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [mainInfoDictionary objectForKey:@"CFBundleDisplayName"];
    if (!appName) {
        appName = [mainInfoDictionary objectForKey:(NSString *)kCFBundleNameKey];
    }
    tipString = [NSString stringWithFormat:@"请在设备的\"设置-隐私-相机\"选项中，允许%@访问你的手机相机", appName];
    
    QMUIAlertController *alertController = [QMUIAlertController alertControllerWithTitle:@"无法拍摄" message:tipString preferredStyle:QMUIAlertControllerStyleAlert];
    
    QMUIAlertAction *okAction = [QMUIAlertAction actionWithTitle:@"我知道了" style:QMUIAlertActionStyleCancel handler:nil];
    [alertController addAction:okAction];
    
    [alertController showWithAnimated:YES];
}

- (void)confirmWithTitle:(NSString *)title subtitle:(NSString *)subtitle confirmBtnTitle:(NSString *)confirmBtnTitle block:(void (^)(void))block {
    QMUIAlertAction *action1 = [QMUIAlertAction actionWithTitle:@"取消" style:QMUIAlertActionStyleCancel handler:NULL];
    QMUIAlertAction *action2 = [QMUIAlertAction actionWithTitle:confirmBtnTitle? confirmBtnTitle: @"确定" style:QMUIAlertActionStyleDestructive handler:^(__kindof QMUIAlertController * _Nonnull aAlertController, QMUIAlertAction * _Nonnull action) {
        block();
    }];
    QMUIAlertController *alertController = [QMUIAlertController alertControllerWithTitle:title message:nil preferredStyle:QMUIAlertControllerStyleAlert];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController showWithAnimated:YES];
}
@end
