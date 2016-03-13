//
//  ColorsStore.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "ColorsStore.h"

@implementation ColorsStore

#pragma mark -
#pragma mark Public Methods

+ (NSArray *)itemsWithError:(NSError **)error controller:(BaseViewController *)controller
{
    *error = nil;
    ColorsStore *store = [[ColorsStore alloc] init];
    NSArray *items = [store makeItemsWithController:controller];
    return items;
}

#pragma mark -
#pragma mark Private Methods

- (NSArray *)makeItemsWithController:(BaseViewController *)controller
{
    return nil;
}

@end
