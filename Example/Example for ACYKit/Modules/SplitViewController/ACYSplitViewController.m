//
//  ACYSplitViewController.m
//  ACYKit
//
//  Created by Arthur Liu on 24/04/2017.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import "ACYSplitViewController.h"
#import "ACYMasterViewController.h"
#import "ACYDetailViewController.h"

@interface ACYSplitViewController ()
<UISplitViewControllerDelegate>

@end

@implementation ACYSplitViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

        [self acy_setMasterViewController:[ACYMasterViewController new]
                     detailViewController:[ACYDetailViewController new]
                        bothEmbededInNavi:YES];
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
}

#pragma mark - Delegates
#pragma mark UISplitViewControllerDelegate


- (BOOL)splitViewController:(UISplitViewController *)splitViewController    collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    
    
    if ([secondaryViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navi = (UINavigationController *)primaryViewController;
        
        ACYMasterViewController *masterVC = (ACYMasterViewController *)navi.topViewController;
        
        return masterVC.acy_shouldCollapseDetailViewController;
    }

    return YES;
}

@end
