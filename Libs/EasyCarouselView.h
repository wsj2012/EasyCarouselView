//
//  EasyCarouselView.h
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyCarouselModel.h"
#import "EasyPageView.h"

NS_ASSUME_NONNULL_BEGIN

@class EasyCarouselView;
@protocol EasyCarouselViewDelegate <NSObject>

- (void)carouselView:(EasyCarouselView *)carouselView didSelectItemAtIndex:(NSInteger)index;

@end

@interface EasyCarouselView : UIView

@property (nonatomic, strong) EasyPageView *pageView;
@property (nonatomic, weak) id <EasyCarouselViewDelegate> delegate;
@property (nonatomic, strong) NSArray <EasyCarouselModel *> *models;
@property (nonatomic, assign) BOOL autoScrollEnabled; // defalut 'YES'

+ (BOOL)showCarouselViewWithModels:(NSArray<EasyCarouselModel *> *)models;

@end

NS_ASSUME_NONNULL_END
