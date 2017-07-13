//
//  ACYLogManager.m
//  Pods
//
//  Created by Arthur Liu on 17/04/2017.
//
//

@import ChameleonFramework;
#import "ACYLogManager.h"


#define acy_hsb(h,s,b) [UIColor colorWithHue:h/360.0f saturation:s/100.0f brightness:b/100.0f alpha:1.0]

@implementation ACYLogManager

+ (void)launch {
    
    // 1. You should install the `XcodeColors` by `Alcatraz`
    setenv("XcodeColors", "YES", 0);
    
    DDTTYLogger *logger = [DDTTYLogger sharedInstance];
    
    
    [DDLog addLogger:logger];
    
    [logger setColorsEnabled:YES];
	
	// flatGreenColorDark
    UIColor *greenColor      = FlatGreen;
    acy_hsb(145, 78, 68);
    UIColor *pinkColor       = FlatPink;
    acy_hsb(324, 49, 96);
    UIColor *orangeColor     = FlatOrange;
    acy_hsb(28, 85, 90);
    UIColor *orangeDarkColor = FlatOrangeDark;
    acy_hsb(24, 100, 83);
    
    
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
