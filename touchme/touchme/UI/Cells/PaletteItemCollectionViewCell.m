//
//  PaletteItemCollectionViewCell.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "PaletteItemCollectionViewCell.h"

//content
#import "PaletteCellSubview.h"

@implementation PaletteItemCollectionViewCell

#pragma mark -
#pragma mark Public Class Overrides

+ (Class)cellSubviewClass
{
    return [PaletteCellSubview class];
}

@end
