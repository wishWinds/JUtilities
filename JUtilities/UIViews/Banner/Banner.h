//
//  Banner.h
//  inJapan
//
//  Created by shupeng on 2018/8/18.
//  Copyright © 2018年 shupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Banner : UIView

@property(nonatomic, strong) UIImage *placeholderImage;

@property(nonatomic, strong) NSArray<NSURL *> *imageURLs;

@property(nonatomic, assign) NSInteger autoscrollInterval;

@property(nonatomic, copy) void (^bannerDidSelectItemAtIndex)(NSInteger index);
@end
