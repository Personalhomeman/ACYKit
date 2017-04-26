//
//  ACYDetailViewController.m
//  ACYKit
//
//  Created by Arthur Qiu on 23/04/2017.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import "ACYDetailViewController.h"

@interface ACYDetailViewController ()

@property (nonatomic, strong) CADisplayLink *timer;

@end

@implementation ACYDetailViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
	[self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self acy_setPrefersStatusBarHidden:YES];
    
    
    [self acy_setPrefersStatusBarHidden:NO
                                  style:UIStatusBarStyleLightContent
                              animation:UIStatusBarAnimationSlide];
}

// Because I using the pod: MLeaksFinder, here is not a retain cycle.
// The instance will not dealloc.
- (BOOL)willDealloc {
    return NO;
}

#pragma mark - Private Methods

- (void)p_tickTack {
//    DDLogInfo(@"tick tack");
}

#pragma mark - Properties
#pragma mark Getter

- (CADisplayLink *)timer {
	if (!_timer) {
		_timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(p_tickTack)];
		
		[_timer acy_setPreferredFramesPerSecond:1];
	}
	return _timer;
}


@end
