//
//  CellSubview.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "CellSubview.h"

@implementation CellSubview

#pragma mark -
#pragma Public Methods

#pragma mark Size

- (CGFloat)heightWithCustomObject:(id)customObject
{
    return 0.0f;
}

+ (CGFloat)recomendedWidth
{
    return 0.0f;
}

#pragma mark Cell

- (void)cleanView
{
}

#pragma mark -
#pragma Public Properties

- (LayoutOptions)layoutOptions
{
    return (LayoutOptions)self.options;
}

@end
