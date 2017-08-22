//
//  ACYServiceLog.m
//  ACYKit
//
//  Created by Arthur Qiu on 2017/08/22.
//  Copyright © 2017 archmagees. All rights reserved.
//

#import "ACYServiceLog.h"

@implementation ACYServiceLog

+ (void)start {
	// 1. You should install the `XcodeColors` by `Alcatraz`
	setenv("XcodeColors", "YES", 0);
	
	DDTTYLogger *logger = [DDTTYLogger sharedInstance];
	
	
	[DDLog addLogger:logger];
	
	[logger setColorsEnabled:YES];
	
	// flatGreenColorDark
	UIColor *greenColor      = FlatGreen;
	UIColor *pinkColor       = FlatPink;
	UIColor *orangeColor     = FlatOrange;
	UIColor *orangeDarkColor = FlatOrangeDark;
	
	
	[logger setForegroundColor:greenColor
			   backgroundColor:nil
					   forFlag:DDLogFlagVerbose];
	
	[logger setForegroundColor:pinkColor
			   backgroundColor:nil
					   forFlag:DDLogFlagDebug];
	
	[logger setForegroundColor:orangeColor
			   backgroundColor:nil
					   forFlag:DDLogFlagInfo];
	
	[logger setForegroundColor:orangeDarkColor
			   backgroundColor:nil
					   forFlag:DDLogFlagWarning];
	
	DDLogVerbose(@"level verbose test");
	DDLogDebug(@"level debug test");
	DDLogInfo(@"level info test");
	DDLogWarn(@"level warn test");
	DDLogError(@"level error test");
}

@end
