//
//  UIResponder+Router.m
//  JUtilities
//
//  Created by shupeng on 2019/5/10.
//  Copyright © 2019 shupeng. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(nullable NSDictionary *)userInfo
{
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}
@end
