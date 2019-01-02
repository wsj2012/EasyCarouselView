//
//  EasyPageView.h
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyPageViewItem.h"
#import "EasyPageControl.h"

NS_ASSUME_NONNULL_BEGIN

@class EasyPageView;

@protocol EasyPageViewDataSource <NSObject>

- (NSInteger)numberOfPagesInPageView:(EasyPageView *)pageView;

- (EasyPageViewItem *)pageView:(EasyPageView *)pageView itemForPageAtIndex:(NSInteger)index;

@end

@protocol EasyPageViewDelegate <NSObject>

@optional
- (void)pageView:(EasyPageView *)pageView didSelectItemAtPage:(NSInteger)page;

- (void)pageView:(EasyPageView *)pageView didScrollToPage:(NSInteger)page;

@end

@interface EasyPageView : UIView

@property (nonatomic, assign) BOOL scrollEnabled; //default 'YES'

@property (nonatomic, assign) BOOL autoScrollEnabled; //default 'NO'

@property (nonatomic, assign) BOOL cycleEnabled; //default 'NO'

@property (nonatomic, assign) BOOL showPageIndicator; //default 'YES'

@property (nonatomic, assign) NSTimeInterval autoScrollInterval; //default '5s'

@property (nonatomic, weak) id <EasyPageViewDataSource> dataSource;

@property (nonatomic, weak) id <EasyPageViewDelegate> delegate;

@property (nonatomic, assign, readonly) NSInteger currentPage;

@property (nonatomic, strong, readonly) EasyPageControl *pageControl;


- (void)reloadData;

- (void)registerClass:(Class)itemClass forItemReuseIdentifier:(NSString *)identifier;

- (EasyPageViewItem *)dequeueReusableItemWithIdentifier:(NSString *)identifier;

- (void)scrollToPage:(NSInteger)page animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
