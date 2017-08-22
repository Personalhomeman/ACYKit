//
//  UIViewController+ACY_UISplitViewController.h
//  Pods
//
//  Created by Arthur Qiu on 23/04/2017.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (ACY_UISplitViewController)

@property (nonatomic, assign) BOOL acy_shouldCollapseDetailViewController;


/**
 Make the master view controller strong retain a reference to store the secondary view controller of UISplitViewController, which will disappear in the `viewControllers` property of `UISplitViewController` if the split view controller is collapsed. At that time, the `viewControllers` count is 1 instead of 2.
 */
@property (nonatomic, strong) __kindof UIViewController *acy_detailViewController;

/**
 Set the `leftBarButtonItem` to `displayModeButtonItem` in the detailViewController of UISplitViewController.
 */
- (void)acy_setDisplayModeButtonItem;

@end
