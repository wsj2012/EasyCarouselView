//
//  EasyCarouselView.m
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import "EasyCarouselView.h"
#import <Masonry.h>
#import "EasyPageViewItem.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define kCarouselViewItem @"EasyCarouselViewItemCell"

@interface EasyCarouselViewItemCell : EasyPageViewItem

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation EasyCarouselViewItemCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.clipsToBounds = YES;
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    return self;
}

@end

@interface EasyCarouselView() <EasyPageViewDataSource, EasyPageViewDelegate>

@end

@implementation EasyCarouselView

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        _pageView = [[EasyPageView alloc] init];
        [_pageView registerClass:[EasyCarouselViewItemCell class] forItemReuseIdentifier:kCarouselViewItem];
        _pageView.dataSource = self;
        _pageView.delegate = self;
        _pageView.autoScrollEnabled = YES;
        _pageView.cycleEnabled = YES;
        _pageView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_pageView];
        [_pageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    return self;
}

#pragma - PageView Datasource

- (NSInteger)numberOfPagesInPageView:(EasyPageView *)pageView {
    return self.models.count;
}

- (EasyPageViewItem *)pageView:(EasyPageView *)pageView itemForPageAtIndex:(NSInteger)index {
    EasyCarouselViewItemCell *cell = (EasyCarouselViewItemCell *)[pageView dequeueReusableItemWithIdentifier:kCarouselViewItem];
    NSURL *url = [NSURL URLWithString:self.models[index].imageUrl];
    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"home_banner"]];
    return cell;
}

#pragma mark - pageView delegate

- (void)pageView:(EasyPageView *)pageView didSelectItemAtPage:(NSInteger)page {
    if ([self.delegate respondsToSelector:@selector(carouselView:didSelectItemAtIndex:)]) {
        [self.delegate carouselView:self didSelectItemAtIndex:page];
    }
}

- (void)setModels:(NSArray<EasyCarouselModel *> *)models
{
    if (models.count == _models.count) {
        for (int i = 0; i < models.count; i++) {
            EasyCarouselModel *new = models[i];
            EasyCarouselModel *old = _models[i];
            if (![new isEqualToCarouselModel:old]) {
                _models = [models copy];
                [self reloadPageView];
                return;
            }
        }
    } else {
        _models = [models copy];
        [self reloadPageView];
    }
}

- (void)reloadPageView
{
    if (_models.count <= 1) {
        self.pageView.scrollEnabled = NO;
        self.pageView.autoScrollEnabled = NO;
    } else {
        self.pageView.scrollEnabled = YES;
        self.pageView.autoScrollEnabled = YES;
    }
    [self.pageView reloadData];
}

+ (BOOL)showCarouselViewWithModels:(NSArray<EasyCarouselModel *> *)models
{
    return models.count > 0;
}

- (void)setAutoScrollEnabled:(BOOL)autoScrollEnabled
{
    self.pageView.autoScrollEnabled = autoScrollEnabled;
}

- (BOOL)autoScrollEnabled
{
    return self.pageView.autoScrollEnabled;
}

@end
