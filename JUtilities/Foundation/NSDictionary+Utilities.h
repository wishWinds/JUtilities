//
//  NSDictionary+Utilities.h
//  JUtilities
//
//  Created by shupeng on 2019/4/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Utilities)
/**
 Returns a new array containing the dictionary's keys sorted.
 The keys should be NSString, and they will be sorted ascending.
 
 @return A new array containing the dictionary's keys,
 or an empty array if the dictionary has no entries.
 */
- (NSArray *)allKeysSorted;

/**
 Returns a new array containing the dictionary's values sorted by keys.
 
 The order of the values in the array is defined by keys.
 The keys should be NSString, and they will be sorted ascending.
 
 @return A new array containing the dictionary's values sorted by keys,
 or an empty array if the dictionary has no entries.
 */
- (NSArray *)allValuesSortedByKeys;

/**
 Returns a BOOL value tells if the dictionary has an object for key.
 
 @param key The key.
 */
- (BOOL)containsObjectForKey:(id)key;

/**
 Returns a new dictionary containing the entries for keys.
 If the keys is empty or nil, it just returns an empty dictionary.
 
 @param keys The keys.
 @return The entries for the keys.
 */
- (NSDictionary *)entriesForKeys:(NSArray *)keys;


/**
 字典 => 字符串
 返回json字符串

 @return <#return value description#>
 */
- (NSString *)jsonStringEncoded;


/**
 字典 => 字符串
 返回pretty printed的json字符串

 @return <#return value description#>
 */
- (NSString *)jsonPrettyStringEncoded;
@end

NS_ASSUME_NONNULL_END
