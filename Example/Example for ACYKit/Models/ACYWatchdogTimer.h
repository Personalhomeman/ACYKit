//
//  ACYWatchdogTimer.h
//  ACYKit
//
//  Created by Arthur Liu on 2017/05/12.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ACYCount) {
    ACYCountZero,
    ACYCountOne,
    ACYCountTwo,
    ACYCountThree,
};

@interface ACYWatchdogTimer : NSObject

- (void)cancel;

@end
