//
//  Menu.m
//  inJapan
//
//  Created by shupeng on 2018/8/19.
//  Copyright © 2018年 shupeng. All rights reserved.
//

#import "Menu.h"
#import "Masonry.h"
#import <QMUIKit/QMUIKit.h>

@interface Menu ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIStackView *stackView;
@property (nonatomic, strong) NSArray *items;
@end

@implementation Menu

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
    [[NSBundle bundleForClass:[Menu class]] loadNibNamed:@"Menu" owner:self options:nil];
    
    [self addSubview:self.contentView];
    self.scrollView.alwaysBounceHorizontal = true;
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)configWithItems:(NSArray *)items {
    [self.stackView.arrangedSubviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    if (items.count == 0) {
        return;
    }
    
    UIImage *normalImage = [UIImage qmui_imageWithColor:[UIColor whiteColor] size:CGSizeMake(10, 2) cornerRadius:0];
    UIImage *selectImage = [UIImage qmui_imageWithColor:[UIColor qmui_colorWithHexString:@"#E90708"] size:CGSizeMake(10, 2) cornerRadius:0];
    for (NSInteger i = 0; i<items.count; i++) {
        QMUIButton *button = [[QMUIButton alloc] init];
        [button setTitle:items[i] forState:UIControlStateNormal];

        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setImagePosition:QMUIButtonImagePositionBottom];
        [button setSpacingBetweenImageAndTitle:3];
        
        [button setTitleColor:[UIColor qmui_colorWithHexString:@"#5A5A5A"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor qmui_colorWithHexString:@"#E90708"] forState:UIControlStateSelected];
        [button setImage:normalImage forState:UIControlStateNormal];
        [button setImage:selectImage forState:UIControlStateSelected];
        [button addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.stackView addArrangedSubview:button];
    }
    
    [self setCurrentIndex:0];
}

- (void)setInset:(UIEdgeInsets)inset {
    _inset = inset;
    
    self.stackView.layoutMargins = inset;
    self.stackView.layoutMarginsRelativeArrangement = true;
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
    
    UIButton *selectBtn;
    if (currentIndex <= 0) {
        _currentIndex = 0;
        
        selectBtn = self.stackView.arrangedSubviews.firstObject;
    } else if (currentIndex >= self.stackView.subviews.count - 1) {
        _currentIndex = self.stackView.subviews.count - 1;
        selectBtn = self.stackView.arrangedSubviews.lastObject;
    } else {
        _currentIndex = currentIndex;
        selectBtn = self.stackView.arrangedSubviews[currentIndex];
    }
    
    [selectBtn setSelected:true];
    [selectBtn setFont:[UIFont fontWithName:@"Medium" size:16]];
    
    [self.scrollView scrollRectToVisible:selectBtn.frame animated:true];
    [self layoutIfNeeded];
}

- (void)btnPressed:(UIButton *)sender {
    NSInteger index = [self.stackView.subviews indexOfObject:sender];
    if (index == _currentIndex) {
        return;
    }
    
    _currentIndex = index;
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
    [self layoutIfNeeded];
}
@end
