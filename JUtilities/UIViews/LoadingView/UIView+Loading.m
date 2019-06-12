//
//  UIView+Loading.m
//  JUtilities
//
//  Created by shupeng on 2019/6/4.
//

#import "UIView+Loading.h"
#import "RuntimeUtilities.h"
#import "Masonry.h"

@interface UIView (Loading)
@property(nonatomic, assign) LoadingState innerLoadingState;
@property(nonatomic, strong) UIView *loadingView;
@end

@implementation UIView (Loading)
DYNAMIC_CTYPE_PROPERTY(innerLoadingState, setInnerLoadingState, LoadingState);
DYNAMIC_OBJECT_PROPERTY(loadingView, setLoadingView, RETAIN, UIView *);

- (void)setLoadingState:(LoadingState)loadingState {
    
    if (loadingState != self.innerLoadingState ) {
        self.innerLoadingState = loadingState;
        if (loadingState == LoadingStateIdle) {
            [UIView animateWithDuration:.35f animations:^{
                self.loadingView.alpha = 0;
            } completion:^(BOOL finished) {
                self.loadingView.alpha = 1;
                [self.loadingView removeFromSuperview];
            }];
        } else if (loadingState == LoadingStateLoading) {
            if (self.loadingView == nil) {
                self.loadingView = [self createLoadingView];
            }
            
            [self addSubview:self.loadingView];
            [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        }
    }
    
}

- (LoadingState)loadingState {
    return [self innerLoadingState];
}

- (UIView *)createLoadingView {
    CGFloat margin = 10;
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor darkGrayColor];
    label.font = [UIFont systemFontOfSize:10];
    label.text = @"正在加载...";
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view);
        make.centerX.equalTo(view).mas_offset((indicator.frame.size.width + margin) / 2);
    }];
    
    indicator.hidesWhenStopped = true;
    [indicator startAnimating];
    [view addSubview:indicator];
    [indicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view);
        make.right.equalTo(label.mas_left).mas_offset(-margin);
    }];
    
    return view;
}
@end
