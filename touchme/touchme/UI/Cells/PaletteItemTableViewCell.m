//
//  PaletteItemTableViewCell.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "PaletteItemTableViewCell.h"

//content
#import "PaletteCellSubview.h"

@implementation PaletteItemTableViewCell

#pragma mark -
#pragma mark Public Class Overrides

+ (Class)cellSubviewClass
{
    return [PaletteCellSubview class];
}

@end
