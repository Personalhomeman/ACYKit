//
//  ACYMasterViewController.m
//  ACYKit
//
//  Created by Arthur Qiu on 23/04/2017.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import "ACYMasterViewController.h"
#import "ACYDetailViewController.h"
#import "ACYWatchdogTimer.h"
#import "ACYReactiveCocoa.h"

@interface ACYMasterViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation ACYMasterViewController {
    ACYWatchdogTimer *watchdog;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.acy_shouldCollapseDetailViewController = YES;
    
    self.view.backgroundColor = [UIColor orangeColor];
    
	[self.tableView acy_alwaysShowHorizontalScrollIndicator:YES];
	[self.tableView acy_alwaysShowVerticalScrollIndicator:YES];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"cell"];
    
    ACYReactiveCocoa *rac = [ACYReactiveCocoa new];
    
    [rac operateSequence];
    
//    [self p_testVariousTimer];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                            forIndexPath:indexPath];
    
    cell.textLabel.text = [@(indexPath.row) stringValue];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    self.acy_shouldCollapseDetailViewController = NO;
    
    [self.splitViewController showDetailViewController:self.acy_detailViewController
                                                sender:nil];

}


#pragma mark - Private Methods

- (void)p_testVariousTimer {
    
    DDLogInfo(@"invoke this method: %s", __PRETTY_FUNCTION__);
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    DDLogInfo(@"invoke this method: %s", __PRETTY_FUNCTION__);
    
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        // the block will NOT be invoked!
        DDLogInfo(@"3 dispatch timer ticktack");
        
    });
    dispatch_resume(timer);
    
    watchdog = [ACYWatchdogTimer new];
    
}

- (void)p_tickTack {
    DDLogInfo(@"2 display link tick tack");
}

#pragma mark - Properties

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
            //
            DDLogInfo(@"1 timer ticktack");
        }];
    }
    return _timer;
}

- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(p_tickTack)];
        
        [_displayLink acy_setPreferredFramesPerSecond:1];
    }
    return _displayLink;
}

@end
