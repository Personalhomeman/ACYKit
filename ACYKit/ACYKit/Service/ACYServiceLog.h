//
//  ACYServiceLog.h
//  ACYKit
//
//  Created by Arthur Qiu on 2017/08/22.
//  Copyright © 2017 archmagees. All rights reserved.
//

@import Foundation;
@import ChameleonFramework;
@import CocoaLumberjack;

/*
 * Step 1:
 * You should install the `XcodeColors` by `Alcatraz`.
 *
 * Step 2:
 * Import the header in your Prefix.pch file:
 *
 * #import <ACYKit/ACYKit.h> or
 * @import ACYKit;
 *
 * Step 3:
 * Add the method into `AppDelegate.m` -> `-application:didFinishLaunchingWithOptions:`.
 *
 * [ACYServiceLog start];
 *
 * Step 4:
 * Replace your NSLog statements with DDLog statements according to the severity of the message.
 *
 * NSLog(@"Fatal error, no dohickey found!"); -> DDLogError(@"Fatal error, no dohickey found!");
 *
 * Step 5:
 * Copy the following code into .pch file or any place you will use the DDLog.
 * 
 #ifdef DEBUG
 static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
 #else
 static const DDLogLevel ddLogLevel = DDLogLevelError;
 #endif
 *
 * You can customize the different log level for different environment.
 *
 * That's all!
 *
 * Now you can use the new log service.
 */


/* CocoaLumberjack */
#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelError;
#endif

@interface ACYServiceLog : NSObject

+ (void)start;

@end
