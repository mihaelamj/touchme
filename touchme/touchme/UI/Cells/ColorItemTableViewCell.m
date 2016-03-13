//
//  ColorItemTableViewCell.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "ColorItemTableViewCell.h"

//content
#import "ColorItemCellSubview.h"

@implementation ColorItemTableViewCell

#pragma mark -
#pragma mark Public Class Overrides

+ (Class)cellSubviewClass
{
    return [ColorItemCellSubview class];
}

@end
