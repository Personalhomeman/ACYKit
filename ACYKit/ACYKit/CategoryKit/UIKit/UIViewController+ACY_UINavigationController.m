//
//  UIViewController+ACY_UINavigationController.m
//  Pods
//
//  Created by Arthur Liu on 24/04/2017.
//
//

#import "UIViewController+ACY_UINavigationController.h"

NS_ASSUME_NONNULL_BEGIN

@implementation UIViewController (ACY_UINavigationController)

- (UINavigationController *)acy_embededInNavigationController {
    UINavigationController *navi =
    [[UINavigationController alloc] initWithRootViewController:self];
    
    return navi;
}

@end

NS_ASSUME_NONNULL_END
