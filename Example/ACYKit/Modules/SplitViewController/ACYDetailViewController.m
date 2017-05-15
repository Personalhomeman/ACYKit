//
//  ACYDetailViewController.m
//  ACYKit
//
//  Created by Arthur Qiu on 23/04/2017.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import "ACYDetailViewController.h"
#import "ACYWatchdogTimer.h"
#import <Masonry/Masonry.h>

@interface ACYDetailViewController ()

// UI
@property (nonatomic, strong) UIView *panGestureView;

@property (nonatomic, strong) CADisplayLink *timer;

@property (nonatomic, strong) NSObject *obj;

@end

@implementation ACYDetailViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
//	[self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(p_handlePanGesture:)];
    
    [self.view addGestureRecognizer:pan];
    
    [self.view acy_addSubviews:@[self.panGestureView]];
//    
    [self.panGestureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
//    [self p_testEnumeration];
    
    
//    [self p_exchangeTwoObject];
    [self p_testCountReference];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self acy_setPrefersStatusBarHidden:YES];
     
}

// Because I using the pod: MLeaksFinder, here is not a retain cycle.
// The instance will not dealloc.
- (BOOL)willDealloc {
    return NO;
}

#pragma mark - Private Methods

-(void)p_exchangeTwoObject {
    NSObject *obj1 = [NSObject new];
    NSObject *obj2 = [NSObject new];
    
    DDLogInfo(@"obj1 :%@",obj1);
    DDLogInfo(@"obj2 :%@",obj2);
    
    NSObject *temp = obj2;
    
    obj2 = obj1;
    obj1 = temp;
    
    DDLogDebug(@"After exchange");
    
    DDLogInfo(@"obj1 :%@",obj1);
    DDLogInfo(@"obj2 :%@",obj2);
    
}

-(void)p_testCountReference {
    NSObject *obj = [NSObject new];
    self.obj = obj;
    
    DDLogInfo(@"self.obj :%@",self.obj);
    DDLogInfo(@"obj :%@",obj);
    
    obj = nil;
    
    DDLogDebug(@"AFTER:---");
    DDLogInfo(@"self.obj :%@",self.obj);
    DDLogInfo(@"obj :%@",obj);
}

- (void)p_tickTack {
//    DDLogInfo(@"tick tack");
}

- (void)p_handlePanGesture:(UIPanGestureRecognizer *)pan {
    
    CGPoint point = [pan locationInView:self.view];
    
    DDLogDebug(@"Point is:%@",NSStringFromCGPoint(point));
}

- (void)p_testEnumeration {
    
    ACYCount count = ACYCountTwo;
    
    switch (count) {
            
        case ACYCountTwo: DDLogInfo(@"two");
        case ACYCountOne: DDLogInfo(@"one");
        case ACYCountZero: DDLogInfo(@"zero");
        case ACYCountThree: DDLogInfo(@"three");
    }
    
    switch (count) {
        case ACYCountZero: DDLogDebug(@"zero");
        case ACYCountOne: DDLogDebug(@"one");
        case ACYCountTwo: DDLogDebug(@"two");
        case ACYCountThree: DDLogDebug(@"three");
    }
    
    
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


- (UIView *)panGestureView {
    if (!_panGestureView) {
        _panGestureView = [UIView new];

    }
    return _panGestureView;
}

@end
