//
//  NSArray+ACY_NSSortDescriptorSorting.m
//  Pods
//
//  Created by Arthur Qiu on 19/04/2017.
//
//

#import "NSArray+ACY_NSSortDescriptorSorting.h"
#import "NSMutableArray+ACY_NSSortDescriptorSorting.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSArray (ACY_NSSortDescriptorSorting)

- (NSArray *)acy_sortedArrayUsingKeys:(NSArray<NSString *> *)keys
							ascending:(BOOL)ascending {
	NSMutableArray *mutableArray = [self mutableCopy];
	
	[mutableArray acy_sortUsingKeys:keys ascending:ascending];
	
	return [mutableArray copy];
}

@end

NS_ASSUME_NONNULL_END
