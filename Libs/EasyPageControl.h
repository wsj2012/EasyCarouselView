//
//  EasyPageControl.h
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EasyPageControl : UIControl

@property (nonatomic) NSInteger numberOfPages;

@property (nonatomic) NSInteger currentPage;

@property (nonatomic) BOOL hidesForSinglePage;

@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

@end

NS_ASSUME_NONNULL_END
