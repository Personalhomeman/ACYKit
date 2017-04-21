//
//  NSArray+ACY_NSSortDescriptorSortingSpec.m
//  ArchyKit
//
//  Created by Arthur Qiu on 19/04/2017.
//  Copyright 2017 Arthur Liu. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "NSArray+ACY_NSSortDescriptorSorting.h"


SPEC_BEGIN(NSArray_ACY_NSSortDescriptorSortingSpec)

describe(@"NSArray+ACY_NSSortDescriptorSorting", ^{

	context(@"array of out of sequence", ^{
		
		NSMutableArray<UIView *> *m = [NSMutableArray array];
		
		NSArray<NSNumber *> *numbers = @[@20, @5, @3000, @3, @34];
		
		
		[numbers enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			
			UIView *object = [[UIView alloc] init];
			object.tag = [obj integerValue];
			
			[m addObject:object];
		}];
		
		it(@"after sorted", ^{
			//
			NSArray<UIView *> *sortedObjects = [m copy];
			
			sortedObjects =
			[sortedObjects acy_sortedArrayUsingKeys:@[@"tag"] ascending:YES];
			
			[[sortedObjects should] haveCountOf:5];
			
			[[theValue([sortedObjects objectAtIndex:0].tag) should] equal:3 withDelta:0];
			
			[[theValue([sortedObjects objectAtIndex:4].tag) should] equal:3000 withDelta:0];
			
		});
	});
});

SPEC_END
