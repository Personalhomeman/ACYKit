//
//  ACYAppDelegate.m
//  ACYKit
//
//  Created by Arthur Liu on 04/21/2017.
//  Copyright (c) 2017 Arthur Liu. All rights reserved.
//

#import "ACYAppDelegate.h"

@implementation ACYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[ACYLogManager launch];
    return YES;
}

@end
