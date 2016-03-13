//
//  BaseItem.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseItem.h"

@implementation BaseItem

@synthesize actionBlock = _actionBlock;

#pragma mark -
#pragma mark Public Properties

- (SimpleBlock)actionBlock
{
    return ^{};
}

@end
