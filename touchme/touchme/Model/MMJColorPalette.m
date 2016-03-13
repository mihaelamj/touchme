//
//  MMJColorPalette.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "MMJColorPalette.h"

@implementation MMJColorPalette

#pragma mark -
#pragma mark Init

- (instancetype)initWithName:(NSString *)name colors:(NSArray *)colors
{
    self = [super init];
    if (self) {
        _name = name;
        _colors = colors;
    }
    return self;
}

@end
