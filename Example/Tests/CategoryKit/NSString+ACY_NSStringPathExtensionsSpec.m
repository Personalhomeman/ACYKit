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
        __block NSString *basePath = @"";
        __block NSString *appendString = @"";
        
        beforeEach(^{
            basePath = @"file:///username/filesys/directory";
            appendString = @"";
        });
        
        it(@"append a string with prefix /", ^{
            //
            basePath = [basePath acy_stringByAppendingPathComponent:@"/prefixHasSlash"];
            
            [[basePath should] equal:@"file:///username/filesys/directory/prefixHasSlash"];
        });
        
        it(@"append a string with suffix /", ^{
            //
            basePath = [basePath acy_stringByAppendingPathComponent:@"suffixHasSlash/"];
            
            [[basePath should] equal:@"file:///username/filesys/directory/suffixHasSlash"];
        });
        
        it(@"append a string without any /", ^{
            //
            basePath = [basePath acy_stringByAppendingPathComponent:@"withoutAnySlash"];
            [[basePath should] equal:@"file:///username/filesys/directory/withoutAnySlash"];
        });
        
        it(@"append a extension with JSON", ^{
            //
            basePath = [basePath acy_stringByAppendingPathComponent:@"filename"];
            basePath = [basePath acy_stringByAppendingPathExtension:@"JSON"];
            
            [[basePath should] equal:@"file:///username/filesys/directory/filename.JSON"];
        });
        
        it(@"delete the extension of a file path", ^{
            NSString *extension = @"JSON";
            basePath = [basePath acy_stringByAppendingPathComponent:@"file"];
            basePath = [basePath acy_stringByAppendingPathExtension:extension];
            
            basePath = [basePath acy_stringByDeletingPathExtension];
            
            [[basePath should] equal:@"file:///username/filesys/directory/file"];
            
        });
        
    });

});

SPEC_END
