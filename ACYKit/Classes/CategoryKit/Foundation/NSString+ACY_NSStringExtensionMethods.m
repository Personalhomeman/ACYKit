//
//  NSString+ACY_NSStringExtensionMethods.m
//  Pods
//
//  Created by Arthur Qiu on 3/26/17.
//
//

#import "NSString+ACY_NSStringExtensionMethods.h"

@implementation NSString (ACY_NSStringExtensionMethods)

- (NSString *)acy_stringByDeletingCharactersAt:(ACYStringPosition)position
                               charactersCount:(NSUInteger)count; {
	// 1.0 Check if count is larger than the length.
	if (count >= self.length) {
		return @"";
	}
	
	// 2.0 Create the range depends on the position and count.
	NSRange range = NSMakeRange(0, 0);
	
	switch (position) {
		case ACYStringPositionPrefix: {
			range = NSMakeRange(0, count);
			break;
		}
		case ACYStringPositionSuffix: {
			range = NSMakeRange(self.length - count, count);
			break;
		}
	}
	
	NSMutableString *str = [self mutableCopy];
	[str deleteCharactersInRange:range];
	
	return [str copy];
}

@end
