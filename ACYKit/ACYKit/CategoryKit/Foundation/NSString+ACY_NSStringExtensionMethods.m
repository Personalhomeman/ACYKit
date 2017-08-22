//
//  NSString+ACY_NSStringExtensionMethods.m
//  Pods
//
//  Created by Arthur Qiu on 3/26/17.
//
//

#import "NSString+ACY_NSStringExtensionMethods.h"
#import "ACYServiceLog.h"

@implementation NSString (ACY_NSStringExtensionMethods)

- (NSString *)acy_stringByDeletingCharactersAt:(ACYStringPosition)position
                               charactersCount:(NSUInteger)count {
	// 1.0 Check if count is larger than the length.
	if (count >= self.length) {
		DDLogError(@"%s, count should NOT larger than or equal to the string length!!!",__PRETTY_FUNCTION__);
		return @"";
	}
	
	if (count <= 0) {
		DDLogError(@"%s, count should NOT less than 0!!!", __PRETTY_FUNCTION__);
		return self;
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
