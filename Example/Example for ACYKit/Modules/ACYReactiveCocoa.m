//
//  ACYReactiveCocoa.m
//  ACYKit
//
//  Created by Arthur on 16/06/2017.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import "ACYReactiveCocoa.h"

@implementation ACYReactiveCocoa

- (void)operateSequence {
    NSArray *array = @[@(2), @(5), @(7), @(15)];
    
    RACSequence *sequence =
    [array rac_sequence];
    
    id mapData = [sequence map:^id(id value) {
        return @([value integerValue] * 2);
    }];
    
    DDLogInfo(@"mapData after map:%@", mapData);
    DDLogInfo(@"sequence after map:%@", [mapData array]);
    
    
    id filterData = [sequence filter:^BOOL(id value) {
        return [value integerValue] % 2 == 1 ;
    }];
    
    
    DDLogInfo(@"filterData after filter:%@",filterData);
    DDLogInfo(@"sequence after filter:%@",[filterData array]);
    
    
    id reduceData = [sequence foldLeftWithStart:@"" reduce:^id(id accumulator, id value) {
        return [accumulator stringByAppendingString:[value stringValue]];
    }];
    
    DDLogInfo(@"sequence after left reduce:%@", reduceData);
    
    
    
    id rightReduceData = [sequence foldRightWithStart:@"" reduce:^id(id first, RACSequence *rest) {
        return [NSString stringWithFormat:@"%@%@", rest.head, first];
    }];
    
    DDLogInfo(@"sequence after right reduce:%@",rightReduceData);
    
    
    id skipData = [sequence skip:1];
    DDLogInfo(@"sequence after skip:%@", skipData);
    DDLogInfo(@"sequence after skip:%@", [skipData array]);
    
    
    // skip until means once the return value is YES, stop skiping value from sequence.
    // skip while means once the return value is NO, stop skipping value from sequence.
    
    
    
    id takeData = [sequence take:2];
    DDLogInfo(@"sequence after take:%@", takeData);
    DDLogInfo(@"sequence after take 2:%@", [takeData array]);
    
    
    // take until means once the return value is YES, stop taking value from sequence.
    id takeUntilData = [sequence takeUntilBlock:^BOOL(id x) {
        return [x integerValue] == 7;
    }];
    DDLogInfo(@"sequence after take until value == 7:%@", takeUntilData);
    DDLogInfo(@"sequence after take until value == 7:%@", [takeUntilData array]);
    
    
    // take while means once the return value is NO, stop takeing value from sequence.
    id takeWhileData = [sequence takeWhileBlock:^BOOL(id x) {
        return [x integerValue] > 1;
    }];
    
    DDLogDebug(@"sequence after take while value > 1:%@", [takeWhileData array]);
    
    
    NSArray *nextArray = @[@"A", @"B", @"C"];

    RACSequence *nextSequence = nextArray.rac_sequence.eagerSequence;
    
    id concatData =
    [[[sequence concat:nextSequence]
      takeWhileBlock:^BOOL(id x) {
          return [x integerValue] % 15 != 0;
      }]
     skipUntilBlock:^BOOL(id x) {
         return [x integerValue] > 5;
     }];
    
    
    
    DDLogInfo(@"sequence after concat:%@", concatData);
    DDLogInfo(@"sequence after concat:%@", [concatData array]);
    
    
    
    NSArray<NSString *> *stringArray = @[@"a", @"b", @"c"];
    RACSequence *stringSequence = stringArray.rac_sequence;
    
    id stringData =
    [stringSequence filter:^BOOL(NSString *value) {
        
        return [value isEqualToString:@"b"];
    }];
    
    DDLogInfo(@"string sequence after filter is:%@", [stringData array]);
    
}

@end
