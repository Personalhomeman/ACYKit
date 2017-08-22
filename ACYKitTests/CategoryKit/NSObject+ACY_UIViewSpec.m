//
//  NSObject+ACY_UIViewSpec.m
//  ACYKit
//
//  Created by Arthur Qiu on 23/04/2017.
//  Copyright 2017 Arthur Liu. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "NSObject+ACY_UIView.h"
#import "ACYServiceLog.h"
#import <objc/runtime.h>


void test_didTap(id self, SEL _cmd) {
	DDLogInfo(@"%@ did tap", self);
}

@interface NSObject ()

- (void)test_didTap;

@end

SPEC_BEGIN(NSObject_ACY_UIViewSpec)


describe(@"NSObject+ACY_UIView", ^{
	
	id target = [NSObject new];
	
	CGRect frame = CGRectMake(0, 0, 100, 100);
	
	class_addMethod([NSObject class], @selector(test_didTap), (IMP)test_didTap, "v@:");
	
	SEL selector = @selector(test_didTap);
	
	__block NSString *actionName = nil;
	
	beforeEach(^{
		actionName = nil;
	});

	
	context(@"Bind action for target", ^{
	
		it(@"UIControl", ^{
			//
			UIControl *control =
			[[UIControl alloc] initWithFrame:frame];
			
			[[control.allTargets should] haveCountOf:0];
			
			[control acy_bindAction:selector withTarget:target];
			
			[[control.allTargets should] haveCountOf:1];
			
			actionName =
			[control actionsForTarget:target
					  forControlEvent:UIControlEventTouchUpInside].firstObject;
			
			[[actionName should] equal:NSStringFromSelector(selector)];
		});
		
		it(@"UIView", ^{
			UIView *view =
			[[UIView alloc] initWithFrame:frame];
			
			[view acy_bindAction:selector withTarget:target];
			
			[[[view.gestureRecognizers firstObject].class should] equal:[UITapGestureRecognizer class]];
			
		});
		
		it(@"UISegmentedControl", ^{
			//
			UISegmentedControl *sc =
			[[UISegmentedControl alloc] initWithItems:@[@"one",@"two"]];
			
			[sc acy_bindAction:selector withTarget:target];
			
			[[sc.allTargets should] haveCountOf:1];

			// There is something problems about the actions.
//			actionName =
//			[sc actionsForTarget:target
//				 forControlEvent:UIControlEventValueChanged].firstObject;
//			
//			[[actionName should] equal:NSStringFromSelector(selector)];
			
		});
		
		
		it(@"UIBarButtonItem", ^{
		
			UIBarButtonItem *item =
			[[UIBarButtonItem alloc] init];
			
			[item acy_bindAction:selector withTarget:target];
			
			[[NSStringFromSelector(item.action) should] equal:NSStringFromSelector(selector)];
			
			[[item.target should] equal:target];
			
			
		});
		
		
		
	});
	
});

SPEC_END
