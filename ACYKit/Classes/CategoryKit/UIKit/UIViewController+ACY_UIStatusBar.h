//
//  UIViewController+ACY_UIStatusBar.h
//  Pods
//
//  Created by Arthur Liu on 26/04/2017.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN




/**
 * Delete the all relative method about setting the `UIStatusBar` style and hidden property. And just set the `-acy_setPrefersStatusBarHidden:` in the class you want.
 
 * Step 1
 * Import the file into your .pch file.
 * 
 * Step 2
 * Invoke the method in `-viewDidLoad` or `viewWillAppear` or any time of lefe cycle.
 *
 */
@interface UIViewController (ACY_UIStatusBar)


/**
 If you want to set multi-properties of status bar, you'd better to invoke this method directly. Do not invoke the following method one by one. That's not recommended.

 @param hidden Set the return value of `-[UIViewController prefersStatusBarHidden]`.
 @param style Set the return value of `-[UIViewController preferredStatusBarStyle]`.
 @param animation Set the return value of `-[UIViewController preferredStatusBarUpdateAnimation]`.
 */
- (void)acy_setPrefersStatusBarHidden:(BOOL)hidden
                                style:(UIStatusBarStyle)style
                            animation:(UIStatusBarAnimation)animation;


/**
 Convenience method to set the status bar property `prefersStatusBarHidden`.
 Other propertis of status bar will use the default value.

 @param hidden Set the return value of `-[UIViewController prefersStatusBarHidden]`.
 */
- (void)acy_setPrefersStatusBarHidden:(BOOL)hidden;


/**
 Convenience method to set the status bar property `UIStatusBarStyle`.
 Other propertis of status bar will use the default value.

 @param style Set the return value of `-[UIViewController preferredStatusBarStyle]`.
 */
- (void)acy_setPreferredStatusBarStyle:(UIStatusBarStyle)style;


/**
 Convenience method to set the status bar property `UIStatusBarStyle`.
 Other propertis of status bar will use the default value.

 @param animation Set the return value of `-[UIViewController preferredStatusBarUpdateAnimation]`.
 */
- (void)acy_setPreferredStatusBarUpdateAnimation:(UIStatusBarAnimation)animation;

@end

NS_ASSUME_NONNULL_END
