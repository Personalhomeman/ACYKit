//
//  UIViewController+ACY_UINavigationController.h
//  Pods
//
//  Created by Arthur Liu on 24/04/2017.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ACY_UINavigationController)


/**
 Convenience method to create a UINavigationController which root view controller is self.

 @return A UINavigationController instance with root view controller is self.
 */
- (UINavigationController *)acy_embededInNavigationController;

@end

NS_ASSUME_NONNULL_END
