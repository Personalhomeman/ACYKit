//
//  NSString+ACY_NSStringPathExtensions.m
//  Pods
//
//  Created by Arthur Qiu on 3/26/17.
//
//

#import "NSString+ACY_NSStringPathExtensions.h"
#import "NSString+ACY_NSStringExtensionMethods.h"

NS_ASSUME_NONNULL_BEGIN

static NSString * const kSlashSymbol = @"/";
static NSString * const kSpaceSymbol = @"";
static NSString * const kDotSymbol = @".";

@implementation NSString (ACY_NSStringPathExtensions)

- (NSString *)acy_stringByAppendingPathComponents:(NSArray<NSString *> *)pathComponents
										extension:(nullable NSString *)extension{
	// failsafe
	if (!pathComponents.count &&
		!extension.length) {
		return self;
	}
	
	
	__block NSString *path = [self copy];
	[pathComponents enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		path = [path acy_stringByAppendingPathComponent:obj];
	}];
	
	if (extension.length) {
		path = [path acy_stringByAppendingPathExtension:extension];
	}
	
	return path;
}

- (NSString *)acy_stringByAppendingPathComponent:(NSString *)pathComponent {
	// failsafe
	if (!pathComponent.length) {
		return self;
	}
	
	
	// 1.0 Make self end with "/" symbol.
	NSString *path = [self copy];
	
	// 1.1 Append a "/" at the end of the path if needed.
	// "http://www.example.com:8388 ===> "http://www.example.com:8388/"
	if (![path hasSuffix:kSlashSymbol]) {
		path = [path stringByAppendingString:kSlashSymbol];
	}
	
	// 2.0 Make the parameter's prefix not begin with "/"
	// 2.1 Remove the "/" at beginning of the path component if needed.
	// "/demo/path/string/" ===> "demo/path/string/"
	while ([pathComponent hasPrefix:kSlashSymbol]) {
		pathComponent = [pathComponent acy_stringByDeletingCharactersAt:ACYStringPositionPrefix charactersCount:1];
	}
	
	// 2.2 Remove the "/" at the end of the path component.
	// "demo/path/string/" ===> "demo/path/string"
	while ([pathComponent hasSuffix:kSlashSymbol]) {
		pathComponent = [pathComponent acy_stringByDeletingCharactersAt:ACYStringPositionSuffix charactersCount:1];
	}
	
	// 3.0 Append the path component to path.
	// now it maybe like this: ""http://www.example.com:8388/demo/path/string
	path = [path stringByAppendingString:pathComponent];
	
	return path;
}

- (NSString *)acy_stringByAppendingPathExtension:(NSString *)pathExtension {
	// failsafe
	if ([pathExtension isEqualToString:kDotSymbol]) {
		return self;
	}
	
	
	
	NSString *path = [self copy];
	// Add the "." symbol at the beginning of the extension.
	if (![pathExtension hasPrefix:kDotSymbol]) {
		pathExtension = [kDotSymbol stringByAppendingString:pathExtension];
	}

	path = [path stringByAppendingString:pathExtension];
	
	return path;
}


- (NSString *)acy_stringByDeletingPathExtension {
	NSString *extension = self.pathExtension;
	
	// no extension provided.
	if (!extension.length) {
		return self;
	}

	NSUInteger count = extension.length + 1;
	NSString *str =
	[self acy_stringByDeletingCharactersAt:ACYStringPositionSuffix
								 charactersCount:count];
	
	return str;
}

- (BOOL)acy_isLocalFilePath {
	BOOL isLocal =
#if TARGET_OS_SIMULATOR
	[self hasPrefix:@"/Users"];
#elif TARGET_OS_IPHONE
	[self hasPrefix:@"/var"];
#endif
	return isLocal;
}

- (NSURL *)acy_URL {
	
	if ([self acy_isLocalFilePath]) {
		return [NSURL fileURLWithPath:self];
	}
	else {
		return [NSURL URLWithString:self];
	}
}



@end

NS_ASSUME_NONNULL_END
