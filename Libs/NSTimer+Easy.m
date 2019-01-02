//
//  NSTimer+Easy.m
//  EasyCarouselView
//
//  Created by 王树军 on 2019/1/2.
//  Copyright © 2019 王树军. All rights reserved.
//

#import "NSTimer+Easy.h"

@implementation NSTimer (Easy)

+ (NSTimer *)easy_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(Block)block repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(easy_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (NSTimer *)yzt_timerWithTimeInterval:(NSTimeInterval)interval
                                 block:(Block)block
                               repeats:(BOOL)repeats{
    return [self timerWithTimeInterval:interval
                                target:self
                              selector:@selector(easy_blockInvoke:)
                              userInfo:[block copy]
                               repeats:YES];
}

+ (void)easy_blockInvoke:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    if(block) {
        block();
    }
}

- (void)easy_start {
    [self setFireDate:[NSDate distantPast]];
}

- (void)easy_startAfter:(NSTimeInterval)sec
{
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:sec]];
}

- (void)easy_pause {
    [self setFireDate:[NSDate distantFuture]];
}

@end
