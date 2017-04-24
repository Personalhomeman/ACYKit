//
//  UISplitViewController+ACY_UISplitViewController.h
//  Pods
//
//  Created by Arthur Liu on 24/04/2017.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISplitViewController (ACY_UISplitViewController)


/**
 Convenience method to set the `UISplitViewControlelr`'s `viewControllers` property. You should invoke the method in the initializer method of the class, otherwise the console will output some warnings.

 @param masterVC The master view controller of the `UISplitViewController`.
 @param detailVC The detail view controller of the `UISplitViewController`.
 @param both YES, means both will be embeded in navigation controller, otherwise means only the master view controlelr will be embeded in navigatioin controller.
 */
- (void)acy_setMasterViewController:(__kindof UIViewController *)masterVC
               detailViewController:(__kindof UIViewController *)detailVC
                  bothEmbededInNavi:(BOOL)both;

@end

NS_ASSUME_NONNULL_END
