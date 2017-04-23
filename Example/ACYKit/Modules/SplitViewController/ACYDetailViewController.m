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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	[self acy_setDisplayModeButtonItem];
	
	[self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

#pragma mark - Private Methods

- (void)p_tickTack {
	
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
