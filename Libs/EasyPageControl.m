//
//  EasyPageControl.m
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import "EasyPageControl.h"
#import <Masonry/Masonry.h>

static const CGFloat kWidth = 5.5;
static const CGFloat kHeight = 5.5;
static const CGFloat kPadding = 12;
static const CGFloat kIndicatorWidth = 9;

@interface EasyPageControl()

@property (nonatomic, strong) NSMutableArray <UIView *> *backgroundIndicators;

@property (nonatomic, strong) UIView *indicator;

@end

@implementation EasyPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _indicator = [[UIView alloc] init];
        _indicator.frame = CGRectMake(0, 0, kIndicatorWidth, kHeight);
        _indicator.layer.cornerRadius = kHeight / 2.0f;
        [self addSubview:_indicator];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    return CGSizeMake(kPadding * (self.numberOfPages + 1) + kWidth * self.numberOfPages, kHeight);
}

- (CGSize)intrinsicContentSize
{
    return [self sizeThatFits:CGSizeZero];
}

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    _numberOfPages = numberOfPages;
    for (UIView *v in self.backgroundIndicators) {
        [v removeFromSuperview];
    }
    [self.backgroundIndicators removeAllObjects];
    
    for (NSInteger i = 0; i < numberOfPages; i++) {
        UIView *v = [[UIView alloc] init];
        v.frame = CGRectMake([self xValueWithIndex:i], 0, kWidth, kHeight);
        v.layer.cornerRadius = kHeight / 2.f;
        v.backgroundColor = _pageIndicatorTintColor;
        [self insertSubview:v belowSubview:_indicator];
        [self.backgroundIndicators addObject:v];
    }
    if (self.hidesForSinglePage && numberOfPages <= 1) {
        self.hidden = YES;
    } else {
        self.hidden = NO;
    }
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo([self sizeThatFits:CGSizeZero]);
    }];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    if (currentPage < 0 || currentPage >= self.numberOfPages) {
        return;
    }
    self.indicator.frame = CGRectMake([self xValueWithIndex:currentPage], 0, kIndicatorWidth, kHeight);
    for (NSInteger i = 0; i < self.backgroundIndicators.count; i++) {
        if (i == currentPage) {
            continue;
        }
        self.backgroundIndicators[i].frame = CGRectMake([self xValueWithIndex:i], 0, kWidth, kHeight);
    }
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
{
    _pageIndicatorTintColor = pageIndicatorTintColor;
    for (UIView *v in self.backgroundIndicators) {
        v.backgroundColor = pageIndicatorTintColor;
    }
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor
{
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    self.indicator.backgroundColor = currentPageIndicatorTintColor;
}

- (NSMutableArray *)backgroundIndicators
{
    if (!_backgroundIndicators) {
        _backgroundIndicators = [NSMutableArray arrayWithCapacity:0];
    }
    return _backgroundIndicators;
}

- (CGFloat)xValueWithIndex:(NSInteger)index
{
    CGFloat x = 0;
    if (index <= self.currentPage) {
        x = (kWidth + kPadding) * index;
    } else {
        x = (index - 1) * kWidth + index * kPadding + kIndicatorWidth;
    }
    return x;
}

@end
