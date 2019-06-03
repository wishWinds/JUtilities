//
//  VCodeButton.h
//  AFNetworking
//
//  Created by shupeng on 2019/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCodeButton : UIButton

@property(nonatomic, assign) NSInteger maxCount;

@property(nonatomic, retain) NSString *afterTitle;

@property(nonatomic, retain) UIColor *defaultColor;
@property(nonatomic, retain) UIColor *countdownClolor;

@property(nonatomic, copy) void (^completed)(void);

- (void)startCountdown;
- (void)stopCountdown;

@end

NS_ASSUME_NONNULL_END
