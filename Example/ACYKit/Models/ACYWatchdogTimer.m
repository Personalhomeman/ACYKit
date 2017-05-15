//
//  ACYWatchdogTimer.m
//  ACYKit
//
//  Created by Arthur Liu on 2017/05/12.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import "ACYWatchdogTimer.h"

@implementation ACYWatchdogTimer {
    dispatch_source_t timer;
}

- (instancetype)init {
    if (self = [super init]) {
        //
        DDLogInfo(@"self is:%@",self);
        
        dispatch_queue_t queue =
//        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, DISPATCH_QUEUE_SERIAL);
        
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(timer, ^{
            DDLogInfo(@"4 watch dog timer wang wang wang");
            
            // this will make it only invoke once.
//            dispatch_source_cancel(timer);
        });
        dispatch_resume(timer);
        
        
        
    }
    return self;
}

- (void)dealloc {
    DDLogInfo(@"dealloc");
    dispatch_source_cancel(timer);
}

- (void)cancel {
    dispatch_source_cancel(timer);
}


@end
