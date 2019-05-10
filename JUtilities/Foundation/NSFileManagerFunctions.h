//
//  NSFileManagerFunctions.h
//  JUtilities
//
//  Created by shupeng on 2019/4/29.
//

#ifndef NSFileManagerFunctions_h
#define NSFileManagerFunctions_h

// 程序目录，不能存任何东西
static inline NSString* AppPath()
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

// 文档目录，需要ITUNES同步备份的数据存这里
static inline NSString* DocPath()
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

// 配置目录，配置文件存这里
static inline NSString* LibPrefPath()
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preferences"];
}

// 缓存目录，系统永远不会删除这里的文件，ITUNES会删除
static inline NSString* LibCachePath()
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
}

// 缓存目录，APP退出后，系统可能会删除这里的内容
static inline NSString* TmpPath()
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/tmp"];
}

// 创建目录
static inline NSString* TouchPath(NSString *path)
{
    if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:path] )
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:path
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:NULL];
    }
    return path;
}

#endif /* NSFileManagerFunctions_h */
