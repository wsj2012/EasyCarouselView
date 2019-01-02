//
//  EasyCarouselModel.m
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import "EasyCarouselModel.h"

@implementation EasyCarouselModel

- (NSString *)diffIdentifier {
    NSMutableString *diff = [NSMutableString stringWithCapacity:0];
    [diff appendString:self.imageUrl ? : @""];
    [diff appendString:self.href ? : @"" ];
    return [diff copy];
}

- (BOOL)isEqualToCarouselModel:(EasyCarouselModel *)model {
    return [[self diffIdentifier] isEqualToString:[model diffIdentifier]];
}

@end
