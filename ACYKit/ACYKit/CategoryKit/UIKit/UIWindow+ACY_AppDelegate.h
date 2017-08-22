//
//  UIWindow+ACY_AppDelegate.h
//  Pods
//
//  Created by Arthur Liu on 24/04/2017.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (ACY_AppDelegate)


/**
 A convenience method to create the UIWindow instance in the AppDelegate.m file.

 @param vc The root view controller of key window.
 @return A UIWindow instance with root view controller and has been make key and visible.
 */
+ (instancetype)acy_makeKeyAndVisibleWithViewController:(__kindof UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
