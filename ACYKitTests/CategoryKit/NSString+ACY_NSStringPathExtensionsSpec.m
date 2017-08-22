//
//  NSString+ACY_NSStringPathExtensionsSpec.m
//  ArchyKit
//
//  Created by Arthur Liu on 18/04/2017.
//  Copyright 2017 Arthur Liu. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "NSString+ACY_NSStringPathExtensions.h"


SPEC_BEGIN(NSString_ACY_NSStringPathExtensionsSpec)

describe(@"NSString+ACY_NSStringPathExtensions", ^{

    context(@"File path stitching", ^{
        //
        NSString *basePath = @"file:///username/filesys/directory";
		__block NSString *path = nil;
        
        beforeEach(^{
			path = nil;
        });
		
		
		it(@"append ", ^{
			//
			path = [basePath acy_stringByAppendingPathComponents:@[@"dir1", @"file"] extension:@".gif"];
			
			[[path should] equal:@"file:///username/filesys/directory/dir1/file.gif"];
		});
		
		
        it(@"append a string with prefix /", ^{
            //
            path = [basePath acy_stringByAppendingPathComponent:@"/prefixHasSlash"];
            
            [[path should] equal:@"file:///username/filesys/directory/prefixHasSlash"];
        });
        
        it(@"append a string with suffix /", ^{
            //
            path = [basePath acy_stringByAppendingPathComponent:@"suffixHasSlash/"];
            
            [[path should] equal:@"file:///username/filesys/directory/suffixHasSlash"];
        });
        
        it(@"append a string without any /", ^{
            //
            path = [basePath acy_stringByAppendingPathComponent:@"withoutAnySlash"];
            [[path should] equal:@"file:///username/filesys/directory/withoutAnySlash"];
        });
        
        it(@"append a extension with JSON", ^{
            //
            path = [basePath acy_stringByAppendingPathComponent:@"filename"];
            path = [path acy_stringByAppendingPathExtension:@"JSON"];
            
            [[path should] equal:@"file:///username/filesys/directory/filename.JSON"];
        });
        
        it(@"delete the extension of a file path", ^{
            NSString *extension = @"JSON";
			
            path = [basePath acy_stringByAppendingPathComponent:@"file"];
            path = [path acy_stringByAppendingPathExtension:extension];
            
            path = [path acy_stringByDeletingPathExtension];
            
            [[path should] equal:@"file:///username/filesys/directory/file"];
            
        });
		
		it(@"append a empty path component and extension", ^{
			
			path = [basePath acy_stringByAppendingPathComponent:@""];
			
			[[path should] equal:basePath];
			
			path = [path acy_stringByAppendingPathExtension:@""];
			
			[[path should] equal:basePath];
			
			
			path = [basePath acy_stringByAppendingPathComponents:@[] extension:nil];
			
			[[path should] equal:basePath];
			
		});
		
		it(@"is a file path", ^{
			
			[basePath stub:@selector(acy_isLocalFilePath)
				 andReturn:theValue(YES)];
			
			NSURL *URL = basePath.acy_URL;
			
			[[URL should] equal:[NSURL fileURLWithPath:basePath]];
			
		});
		
		it(@"is a URI path", ^{
			
			[basePath stub:@selector(acy_isLocalFilePath)
				 andReturn:theValue(NO)];
			
			NSString *url = @"http://www.baidu.com";
			
			NSURL *URL = [url acy_URL];
			
			[[URL should] equal:[NSURL URLWithString:url]];
			
		});
        
    });

});

SPEC_END
