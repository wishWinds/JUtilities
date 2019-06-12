//
//  UIView+Loading.h
//  JUtilities
//
//  Created by shupeng on 2019/6/4.
//

#import <UIKit/UIKit.h>
#import "RuntimeUtilities.h"
#import "FoundationUtilities.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LoadingState) {
    LoadingStateIdle = 0,
    LoadingStateLoading
};

@interface UIView (Loading)
@property(nonatomic, assign) LoadingState loadingState;
@end

NS_ASSUME_NONNULL_END
