//
//  JMenu.m
//  JUtilitiesDemo
//
//  Created by shupeng on 2019/6/19.
//  Copyright © 2019 shupeng. All rights reserved.
//

#import "JMenu.h"
#import "Masonry.h"


@interface JMenu ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIView *indicator;
@end

@implementation JMenu

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
    [[NSBundle bundleForClass:[Menu class]] loadNibNamed:@"JMenu" owner:self options:nil];
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)setInset:(UIEdgeInsets)inset {
    _inset = inset;
    
    
}

- (void)setSpacing:(NSInteger)spacing {
    _spacing = spacing;
    self.stackView.spacing = spacing;
}

- (void)setAutoSpacing:(BOOL)autoSpacing {
    _autoSpacing = autoSpacing;
    // xib里实现的是非自适应间距的. 这里仅对需要自适应的进行处理.
    if (_autoSpacing) {
        // 固定宽度为父容器宽度
        [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.contentView.mas_width);
        }];
        // 重新设置distribution
        self.stackView.distribution = UIStackViewDistributionEqualSpacing;
    } else {
        
    }
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    [self.stackView.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setSelected:false];
        obj.titleLabel.font = [UIFont systemFontOfSize:14];
    }];
    
    if (currentIndex <= 0) {
        _currentIndex = 0;
        
        [(UIButton *)self.stackView.subviews.firstObject setSelected:true];
        [[(UIButton *)self.stackView.subviews.firstObject titleLabel] setFont:[UIFont fontWithName:@"Medium" size:16]];
    } else if (currentIndex >= self.stackView.subviews.count - 1) {
        _currentIndex = self.stackView.subviews.count - 1;
        [(UIButton *)self.stackView.subviews.lastObject setSelected:true];
        [[(UIButton *)self.stackView.subviews.lastObject titleLabel] setFont:[UIFont fontWithName:@"Medium" size:16]];
    } else {
        _currentIndex = currentIndex;
        [(UIButton *)self.stackView.subviews[currentIndex] setSelected:true];
        [[(UIButton *)self.stackView.subviews[currentIndex] titleLabel] setFont:[UIFont fontWithName:@"Medium" size:16]];
    }
    
    [self layoutIfNeeded];
}

- (void)btnPressed:(UIButton *)sender {
    _currentIndex = [self.stackView.subviews indexOfObject:sender];
    
    [self.stackView.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setSelected:false];
        obj.titleLabel.font = [UIFont systemFontOfSize:14];
    }];
    
    [sender setSelected:true];
    [[sender titleLabel] setFont:[UIFont fontWithName:@"Medium" size:16]];
    if (self.menuDidSelectAtIndex) {
        self.menuDidSelectAtIndex(_currentIndex);
    }
    
    // qmui官方临时解决方案. (内容显示不全)
    [sender sizeToFit];
    [self.contentView layoutIfNeeded];
}
