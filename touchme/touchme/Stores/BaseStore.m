//
//  BaseStore.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseStore.h"

@implementation BaseStore

#pragma mark -
#pragma mark Public Methods

+ (NSArray *)itemsWithError:(NSError **)error
{
    *error = [[NSError alloc] initWithDomain:@"ErrorBaseLocalStore" code:0 userInfo:@{NSLocalizedDescriptionKey : @"Error fetching items!"}];
    return nil;
}

@end
