//
//  NSArray+MMJRandom.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "NSArray+MMJRandom.h"

@implementation NSArray (MMJRandom)

- (id)randomObject
{
    NSUInteger myCount = [self count];
    if (myCount) {
        return [self objectAtIndex:arc4random_uniform(myCount)];
    } else {
        return nil;
    }
}

- (NSArray *)randomObjects:(NSInteger)count
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        id item = [self randomObject];
        if (item) {
            [array addObject:item];
        }
    }
    return [NSArray arrayWithArray:array];
}

@end
