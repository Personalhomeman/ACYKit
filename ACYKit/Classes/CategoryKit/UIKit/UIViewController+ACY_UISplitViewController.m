//
//  UIViewController+ACY_UISplitViewController.m
//  Pods
//
//  Created by Arthur Qiu on 23/04/2017.
//
//

#import "UIViewController+ACY_UISplitViewController.h"

@implementation UIViewController (ACY_UISplitViewController)

- (void)acy_setDisplayModeButtonItem {
	
	self.navigationItem.leftBarButtonItem =
	self.splitViewController.displayModeButtonItem;
	
	self.navigationItem.leftItemsSupplementBackButton = YES;
}

@end
