//
//  ACYConstants.m
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import "ACYConstants.h"

NS_ASSUME_NONNULL_BEGIN

BOOL ACY_IOS_9;
BOOL ACY_IOS_10;
BOOL ACY_IOS_11;

@implementation ACYConstants

+ (void)load {
    float version = [UIDevice currentDevice].systemVersion.floatValue;
    
    ACY_IOS_9  = version >= 9.0;
    ACY_IOS_10 = version >= 10.0;
	ACY_IOS_11 = version >= 11.0;
	
    // Here the Cocoalumjack framework is not loaded, so use NSLog instead.
    NSLog(@"iOS version is %f",version);
}

@end

NS_ASSUME_NONNULL_END
