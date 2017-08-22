//
//  UIWindow+ACY_AppDelegate.m
//  Pods
//
//  Created by Arthur Liu on 24/04/2017.
//
//

#import "UIWindow+ACY_AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@implementation UIWindow (ACY_AppDelegate)

+ (instancetype)acy_makeKeyAndVisibleWithViewController:(__kindof UIViewController *)vc {
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:frame];
    
    window.rootViewController = vc;
    
    [window makeKeyAndVisible];
    
    return window;
}

@end

NS_ASSUME_NONNULL_END
