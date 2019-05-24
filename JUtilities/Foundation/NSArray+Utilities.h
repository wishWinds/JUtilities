//
//  NSArray+HighOrderFunction.h
//  JUtilities
//
//  Created by shupeng on 2019/4/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (UTilities)
#pragma mark - 函数式编程 高阶函数
- (NSArray *)map:(id (^)(id obj))block;
- (NSArray *)filter:(BOOL (^)(id obj))block;
- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block;
- (NSArray *)flatMap:(id (^)(id obj))block;
- (BOOL)contains:(BOOL (^)(id obj))block;
- (void)forEach:(void (^)(id obj))block;
@end


NS_ASSUME_NONNULL_END
