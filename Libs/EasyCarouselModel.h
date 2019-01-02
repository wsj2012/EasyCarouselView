//
//  EasyCarouselModel.h
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EasyCarouselModel : NSObject

@property (nonatomic, strong) NSString *imageUrl;

@property (nonatomic, strong) NSString *href;

- (BOOL)isEqualToCarouselModel:(EasyCarouselModel *)model;

@end

NS_ASSUME_NONNULL_END
