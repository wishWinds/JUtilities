//
//  Banner.m
//  inJapan
//
//  Created by shupeng on 2018/8/18.
//  Copyright © 2018年 shupeng. All rights reserved.
//

#import "Banner.h"
#import "RuntimeUtilities.h"
#import "UIUtilities.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "BlocksKit.h"
#import "BlocksKit+UIKit.h"

@interface Banner () <UIScrollViewDelegate>
@property(strong, nonatomic) IBOutlet UIView *contentView;
@property(strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong, nonatomic) IBOutlet UIPageControl *pageControl;

@property(nonatomic, strong) NSArray *images;
@property(nonatomic, strong) NSTimer *timer;
@end

@implementation Banner
- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    [self setupXIB];
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    [self setupXIB];
    return self;
}

- (void)setupXIB {
    [[NSBundle bundleForClass:[Banner class]] loadNibNamed:@"Banner" owner:self options:nil];

    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];

    self.scrollView.pagingEnabled = true;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = self.scrollView.showsVerticalScrollIndicator = false;
}

- (void)scrollToNextPage {
    CGPoint offset = self.scrollView.contentOffset;
    CGSize contentSize = self.scrollView.contentSize;
    NSInteger currentPage = floor(offset.x / self.scrollView.width);
    NSInteger maxPage = floor(contentSize.width / self.scrollView.width);
    if (currentPage >= maxPage - 1) {
        currentPage = 0;
    } else {
        currentPage++;
    }

    [self.scrollView setContentOffset:CGPointMake(currentPage * self.scrollView.width, 0) animated:true];
}

- (void)setImageURLs:(NSArray<NSURL *> *)imageURLs {
    _imageURLs = imageURLs;

    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView *obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    self.pageControl.numberOfPages = imageURLs.count;

    if (imageURLs.count == 0) {
        return;
    }
    
    for (int i = 0; i < imageURLs.count; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = true;
        [self.scrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(self);
            make.top.bottom.equalTo(self.scrollView);
        }];

        if (i == 0) {
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.scrollView);
            }];
        } else {
            UIView *view = [self.scrollView.subviews objectAtIndex:i - 1];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(view.mas_right);
            }];

            if (i == imageURLs.count - 1) {
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(self.scrollView);
                }];
            }
        }

        NSURL *imageURL = imageURLs[i];
        if ([imageURL isKindOfClass:[NSString class]]) {
            imageURL = [NSURL URLWithString:imageURL];
        }
        [imageView sd_setImageWithURL:imageURL placeholderImage:self.placeholderImage];

        imageView.userInteractionEnabled = true;
        @weakify(self)
        [imageView bk_whenTapped:^{
            @strongify(self)
            if (self.bannerDidSelectItemAtIndex) {
                self.bannerDidSelectItemAtIndex(i);
            }
        }];
    }
    
    [self createAutoScrollTimerIfNeeded];
}

- (void)createAutoScrollTimerIfNeeded {
    if (self.autoscrollInterval != 0) {
        @weakify(self)
        self.timer = [NSTimer bk_scheduledTimerWithTimeInterval:self.autoscrollInterval block:^(NSTimer *timer) {
            @strongify(self)
            [self scrollToNextPage];
        } repeats:true];
    }
}

- (void)stopAutoScrollTimerIfNeeded {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self updatePageControl];

    [self createAutoScrollTimerIfNeeded];
}

- (void)updatePageControl {
    CGPoint offset = self.scrollView.contentOffset;
    CGFloat page = offset.x / self.scrollView.width;

    self.pageControl.currentPage = page;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self updatePageControl];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopAutoScrollTimerIfNeeded];
}
@end
