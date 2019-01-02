//
//  EasyPageViewItem.m
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import "EasyPageViewItem.h"

@interface EasyPageViewItem()

@property (nonatomic, readwrite, copy) NSString *reuseIdentifier;

@end

@implementation EasyPageViewItem

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super init]) {
        _reuseIdentifier = reuseIdentifier;
    }
    return self;
}

@end
