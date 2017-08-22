//
//  NSMutableArray+ACY_NSExtendedMutableArray.m
//  Pods
//
//  Created by Arthur on 03/08/2017.
//
//

#import "NSMutableArray+ACY_NSExtendedMutableArray.h"

@implementation NSMutableArray (ACY_NSExtendedMutableArray)

- (void)acy_insertObjects:(NSArray *)objects atIndex:(NSInteger)index {
    
    if (!objects.count) {
        return;
    }
    
    NSRange range = NSMakeRange(index, objects.count);
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
    
    [self insertObjects:objects atIndexes:indexSet];
}

@end
