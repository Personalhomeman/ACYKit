//
//  NSString+ACY_NSStringExtensionMethods.h
//  Pods
//
//  Created by Arthur Qiu on 3/26/17.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ACYStringPosition) {
	ACYStringPositionPrefix, // prefix
	ACYStringPositionSuffix, // suffix
};

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ACY_NSStringExtensionMethods)

- (NSString *)acy_stringByDeletingCharactersAt:(ACYStringPosition)position
                               charactersCount:(NSUInteger)count;

@end

NS_ASSUME_NONNULL_END
