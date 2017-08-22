//
//  UISplitViewController+ACY_UISplitViewController.m
//  Pods
//
//  Created by Arthur Liu on 24/04/2017.
//
//

#import "UISplitViewController+ACY_UISplitViewController.h"
#import "UIViewController+ACY_UINavigationController.h"
#import "UIViewController+ACY_UISplitViewController.h"

NS_ASSUME_NONNULL_BEGIN

@implementation UISplitViewController (ACY_UISplitViewController)

- (void)acy_setMasterViewController:(__kindof UIViewController *)masterVC
               detailViewController:(__kindof UIViewController *)detailVC
                  bothEmbededInNavi:(BOOL)both {
    
    
    
    
    if (both) {
        self.viewControllers =
        @[masterVC.acy_embededInNavigationController,
          detailVC.acy_embededInNavigationController];
        
        [detailVC acy_setDisplayModeButtonItem];
    }
    else {
        
        self.viewControllers =
        @[masterVC.acy_embededInNavigationController,
          detailVC];
        
        
    }
    
    
//     store the detail view controller reference at latst!
    masterVC.acy_detailViewController =
    both ?
    detailVC.navigationController :
    detailVC;
    
}

@end

NS_ASSUME_NONNULL_END
