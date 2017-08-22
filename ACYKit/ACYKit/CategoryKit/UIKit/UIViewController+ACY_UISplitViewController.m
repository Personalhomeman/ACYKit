//
//  UIViewController+ACY_UISplitViewController.m
//  Pods
//
//  Created by Arthur Qiu on 23/04/2017.
//
//

#import "UIViewController+ACY_UISplitViewController.h"
#import <objc/runtime.h>
#import "ACYServiceLog.h"

static const void * acy_shouldCollapseDetailViewControllerKey = &acy_shouldCollapseDetailViewControllerKey;
static const void * acy_detailViewControllerKey = &acy_detailViewControllerKey;

@implementation UIViewController (ACY_UISplitViewController)

@dynamic acy_shouldCollapseDetailViewController;
@dynamic acy_detailViewController;

- (void)acy_setDisplayModeButtonItem {
	
	self.navigationItem.leftBarButtonItem =
	self.splitViewController.displayModeButtonItem;
	
	self.navigationItem.leftItemsSupplementBackButton = YES;
}

#pragma mark - Properties
#pragma mark Getter

- (BOOL)acy_shouldCollapseDetailViewController {
    return [objc_getAssociatedObject(self, &acy_shouldCollapseDetailViewControllerKey) boolValue];
}

- (void)setAcy_shouldCollapseDetailViewController:(BOOL)acy_shouldCollapseDetailViewController {
    objc_setAssociatedObject(self, &acy_shouldCollapseDetailViewControllerKey, @(acy_shouldCollapseDetailViewController), OBJC_ASSOCIATION_ASSIGN);
}

- (void)setAcy_detailViewController:(__kindof UIViewController *)acy_detailViewController {
    objc_setAssociatedObject(self, &acy_detailViewControllerKey, acy_detailViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (__kindof UIViewController *)acy_detailViewController {
    __kindof UIViewController *vc =
    objc_getAssociatedObject(self, &acy_detailViewControllerKey);
    
    DDAssert(vc, @"detail view controller of master view controller is not set before, you should set in the initializer method of UISplitViewController");
    
    return vc;
}

@end
