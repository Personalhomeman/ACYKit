//
//  NSObject+ACY_UIView.m
//  Pods
//
//  Created by Arthur Liu on 18/04/2017.
//
//

#import "NSObject+ACY_UIView.h"
#import "ACYLogManager.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSObject (ACY_UIView)

- (void)acy_bindAction:(SEL)action
            withTarget:(id)target {
    
    DDAssert(action, @"action should not be nil");
    DDAssert(target, @"target should not be nil");
    
    
    // UIControl, including: button, etc.
    if ([self isKindOfClass:[UIControl class]]) {
        UIControl *control = (UIControl *)self;
        
        [control addTarget:target
                    action:action
          forControlEvents:UIControlEventTouchUpInside];
    }
    // UIView
    else if ([self isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)self;
        UITapGestureRecognizer *tap =
        [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        
        [view addGestureRecognizer:tap];
    }
    // UISegmentedControl
    else if ([self isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl *sc = (UISegmentedControl *)self;
        
        [sc addTarget:target
               action:action
     forControlEvents:UIControlEventValueChanged];
    }
    // UIBarButtonItem
    else if ([self isKindOfClass:[UIBarButtonItem class]]) {
        UIBarButtonItem *barButton = (UIBarButtonItem *)self;
        
        barButton.target = target;
        barButton.action = action;
    }

}

@end

NS_ASSUME_NONNULL_END
