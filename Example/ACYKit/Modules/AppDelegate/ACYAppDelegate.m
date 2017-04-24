//
//  ACYAppDelegate.m
//  ACYKit
//
//  Created by Arthur Liu on 04/21/2017.
//  Copyright (c) 2017 Arthur Liu. All rights reserved.
//

#import "ACYAppDelegate.h"
#import "ACYSplitViewController.h"

@implementation ACYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[ACYLogManager launch];
      
    ACYSplitViewController *split = [[ACYSplitViewController alloc] init];
    self.window = [UIWindow acy_makeKeyAndVisibleWithViewController:split];
    
    return YES;
}

@end
