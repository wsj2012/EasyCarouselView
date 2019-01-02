//
//  NSTimer+Easy.h
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/*****************************
 示例: 防止循环引用
 __weak typeof(self) weakSelf = self;
 _timer = [NSTimer easy_scheduledTimerWithTimeInterval:1.0 block:^{
 ViewController *strongSelf = weakSelf;
 [strongSelf doSomething];
 } repeats:YES];
 
 ****************************/


typedef void (^Block)(void);

@interface NSTimer (Easy)

+ (NSTimer *)easy_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                           block:(Block)block
                                         repeats:(BOOL)repeats;
- (void)easy_start;

- (void)easy_startAfter:(NSTimeInterval)sec;

-(void)easy_pause;

@end

NS_ASSUME_NONNULL_END
