//
//  VCodeButton.m
//  AFNetworking
//
//  Created by shupeng on 2019/5/26.
//

#import "VCodeButton.h"
#import "RuntimeUtilities.h"

@interface VCodeButton ()
@property(nonatomic, assign) NSInteger count;
@property(nonatomic, strong) NSTimer *countdownTimer;
@end
@implementation VCodeButton

- (void)startCountdown {
    [self setCount:[self maxCount]];
    [self updateTitle];
    [self setTitleColor:self.countdownClolor forState:UIControlStateNormal];

    self.enabled = false;
    
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:true];
}

- (void)stopCountdown {
    [self.countdownTimer invalidate];
    [self setTitle:self.afterTitle forState:UIControlStateNormal];
    [self setTitleColor:self.defaultColor forState:UIControlStateNormal];
}

- (void)updateTitle {
    [self setTitle:[NSString stringWithFormat:@"%@", @([self count])] forState:UIControlStateNormal];
}

- (void)timerFired:(NSTimer *)timer {
    NSInteger nextCount = [self count] - 1;
    // 还未结束
    if (nextCount > 0) {
        [self setCount:nextCount];
        [self updateTitle];
    }
    // 即将结束
    else {
        self.enabled = true;
        [self setTitle:self.afterTitle forState:UIControlStateNormal];
        [self.countdownTimer invalidate];
        [self setTitleColor:self.defaultColor forState:UIControlStateNormal];

        if (self.completed) {
            self.completed();
        }
    }
}
@end
