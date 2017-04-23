//
//  UIScrollView+ACY_ScrollIndicatorsSpec.m
//  ACYKit
//
//  Created by Arthur Qiu on 23/04/2017.
//  Copyright 2017 Arthur Liu. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "UIScrollView+ACY_ScrollIndicators.h"
#import <Foundation/Foundation.h>


SPEC_BEGIN(UIScrollView_ACY_ScrollIndicatorsSpec)

describe(@"UIScrollView+ACY_ScrollIndicators", ^{

	context(@"Need to always display the indicators", ^{
		//
		CGRect frame = CGRectMake(0, 0, 100, 100);

		__block UIScrollView *sv = nil;
		
		beforeEach(^{
			sv = [[UIScrollView alloc] initWithFrame:frame];
			sv.contentSize = frame.size;
		});
		
		it(@"horizontal direction", ^{
			//
			[sv acy_alwaysShowHorizontalScrollIndicator:YES];
			
			// can not test by using code.
//			[[[[sv.subviews lastObject] class] shouldNot] beMemberOfClass:[UIImageView class]];
		});
		
		it(@"vertical direction", ^{
			//
			[sv acy_alwaysShowVerticalScrollIndicator:YES];
			
			// can not test by using code.
//			[[[sv.subviews lastObject] shouldNot] beMemberOfClass:[UIImageView class]];
		
		});
		
		
		
		
	});
});

SPEC_END
