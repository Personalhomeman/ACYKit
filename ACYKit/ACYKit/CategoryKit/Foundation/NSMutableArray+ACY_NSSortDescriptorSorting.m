//
//  NSMutableArray+ACY_NSSortDescriptorSorting.m
//  Pods
//
//  Created by Arthur Qiu on 19/04/2017.
//
//

#import "NSMutableArray+ACY_NSSortDescriptorSorting.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSMutableArray (ACY_NSSortDescriptorSorting)

- (void)acy_sortUsingKeys:(NSArray<NSString *> *)keys
				ascending:(BOOL)ascending {

	NSMutableArray *sortDescriptors = [NSMutableArray array];
	
	[keys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		NSSortDescriptor *sortDescriptor =
		[[NSSortDescriptor alloc] initWithKey:obj ascending:ascending];
		
		[sortDescriptors addObject:sortDescriptor];
	}];
	
	[self sortUsingDescriptors:sortDescriptors];
}

@end

NS_ASSUME_NONNULL_END
