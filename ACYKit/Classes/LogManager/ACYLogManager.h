//
//  ACYLogManager.h
//  Pods
//
//  Created by Arthur Liu on 17/04/2017.
//
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

/*
 * Step 1:
 * You should install the `XcodeColors` by `Alcatraz`.
 * 
 * Step 2:
 * Import the header in your Prefix.pch file:
 *
 * #import <ACYKit/ACYLogManager.h
 *
 * Step 3:
 * Add the method into AppDelegate.m -> -application:didFinishLaunchingWithOptions: .
 *
 * [ACYLogManager launch];
 *
 * Step 4:
 * Replace your NSLog statements with DDLog statements according to the severity of the message.
 *
 * NSLog(@"Fatal error, no dohickey found!"); -> DDLogError(@"Fatal error, no dohickey found!");
 *
 * Now you can use the new log service.
 */


/* CocoaLumberjack */
#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelError;
#endif


///======================================================================
/// @name ACYLogManager
///======================================================================
@interface ACYLogManager : NSObject

+ (void)launch;

@end
