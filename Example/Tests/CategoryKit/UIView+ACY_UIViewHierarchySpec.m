//
//  UIView+ACY_UIViewHierarchySpec.m
//  ACYKit
//
//  Created by Arthur Qiu on 23/04/2017.
//  Copyright 2017 Arthur Liu. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "UIView+ACY_UIViewHierarchy.h"


SPEC_BEGIN(UIView_ACY_UIViewHierarchySpec)

describe(@"UIView+ACY_UIViewHierarchy", ^{

	context(@"A view in the screen", ^{
		//
		CGRect frame = [UIScreen mainScreen].bounds;
		UIView *view = [[UIView alloc] initWithFrame:frame];
		
		it(@"add some subviews", ^{
			//
			[view acy_addSubviews:@[[UIView new],
									[UILabel new],
									[UIButton new],]];
			
			[[theValue(view.subviews.count) should] equal:theValue(3)];
		});
		
		
		it(@"expand a subview's touch area", ^{
			
			CGPoint touchPoint = CGPointMake(120, 120);
			
			UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
			
			
			BOOL pointInside =
			[subview pointInside:touchPoint withEvent:nil];
			
			[[theValue(pointInside) should] beNo];
			
			
			[subview acy_expandTouchAreaToSize:CGSizeMake(130, 130)];
			pointInside =
			[subview pointInside:touchPoint withEvent:nil];
			
			
			[[theValue(pointInside) should] beYes];
			
			
			// Just the point in the boundary of frame
			[subview acy_expandTouchAreaWithSizeOffset:CGSizeMake(40, 40)];
			
			pointInside =
			[subview pointInside:touchPoint withEvent:nil];
			
			[[theValue(pointInside) should] beNo];
			
		});
		
	});
	
});

SPEC_END
