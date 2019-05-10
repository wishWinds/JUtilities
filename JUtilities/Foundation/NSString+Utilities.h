//
//  NSString+Utilities.h
//  JUtilities
//
//  Created by shupeng on 2019/4/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Utilities)
/**
 Trim blank characters (space and newline) in head and tail.
 @return the trimmed string.
 */
- (NSString *)stringByTrim;

/**
 nil, @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.
 */
- (BOOL)isNotBlank;

/**
 Returns YES if the target string is contained within the receiver.
 @param string A string to test the the receiver.
 
 @discussion Apple has implemented this method in iOS8.
 */
- (BOOL)containsString:(NSString *)string;

/**
 Returns an NSData using UTF-8 encoding.
 */
- (NSData *)dataValue;

/**
 Create a string from the file in main bundle (similar to [UIImage imageNamed:]).
 
 @param name The file name (in main bundle).
 
 @return A new string create from the file in UTF-8 character encoding.
 */
+ (NSString *)stringNamed:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
