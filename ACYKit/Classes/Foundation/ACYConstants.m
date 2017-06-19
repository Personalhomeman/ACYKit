//
//  ACYConstants.m
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import "ACYConstants.h"

NS_ASSUME_NONNULL_BEGIN

BOOL ACY_ABOVE_IOS_9_0;
BOOL ACY_ABOVE_IOS_10_0;

@implementation ACYConstants

+ (void)load {
    float version = [UIDevice currentDevice].systemVersion.floatValue;
    
    ACY_ABOVE_IOS_9_0  = version >= 9.0;
    ACY_ABOVE_IOS_10_0 = version >= 10.0;
    
    // Here the Cocoalumjack framework is not loaded, so use NSLog instead.
    NSLog(@"iOS version is %f",version);
}

@end

NS_ASSUME_NONNULL_END
