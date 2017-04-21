//
//  NSString+ACY_NSStringExtensionMethodsSpec.m
//  ArchyKit
//
//  Created by Arthur Liu on 18/04/2017.
//  Copyright 2017 Arthur Liu. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "NSString+ACY_NSStringExtensionMethods.h"


SPEC_BEGIN(NSString_ACY_NSStringExtensionMethodsSpec)

describe(@"NSString+ACY_NSStringExtensionMethods", ^{

    context(@"path string", ^{
        
        __block NSString *originalString;
        
        beforeEach(^{
            originalString = @"file:///usr/dir/work/cosplay.avi";
        });
        
        it(@"delete the 5 characters in the prefix", ^{
            //
            originalString =
            [originalString acy_stringByDeletingCharactersAt:ACYStringPositionPrefix
                                             charactersCount:5];
            
            [[originalString should] equal:@"///usr/dir/work/cosplay.avi"];
        });
        
        it(@"delete the 10 characters in the suffix", ^{
            //
            originalString =
            [originalString acy_stringByDeletingCharactersAt:ACYStringPositionSuffix
                                             charactersCount:10];
            
            [[originalString should] equal:@"file:///usr/dir/work/c"];
        });
        
        it(@"delete characters count larger than itself", ^{
            originalString =
            [originalString acy_stringByDeletingCharactersAt:ACYStringPositionPrefix
                                             charactersCount:100];
            
            [[originalString should] equal:@""];
        });
        
        
    });
        
});

SPEC_END
