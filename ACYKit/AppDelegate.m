//
//  AppDelegate.m
//  ACYKit
//
//  Created by Arthur Qiu on 2017/08/22.
//  Copyright © 2017 archmagees. All rights reserved.
//

#import "AppDelegate.h"
#import "ACYServiceLog.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	[ACYServiceLog start];
	
	return YES;
}

@end
