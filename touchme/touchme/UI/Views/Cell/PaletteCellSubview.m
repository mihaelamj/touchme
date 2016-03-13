//
//  PaletteCellSubview.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "PaletteCellSubview.h"

//model
#import "MMJColorPalette.h"

@interface PaletteCellSubview ()

@property (nonatomic, strong) UIImageView *paletteImageView;
@property (nonatomic, strong) UILabel *paletteNameLabel;
@property (nonatomic, strong) UILabel *numberOfColorsLabel;

@end

@implementation PaletteCellSubview

#pragma mark -
#pragma mark Public Overrides

#pragma mark Layout

- (void)addCustomSubviews
{
    self.backgroundColor = [UIColor colorWithStyle:TMColorStyle_White];
    [self addSubview:self.paletteImageView];
    [self addSubview:self.paletteNameLabel];
    [self addSubview:self.numberOfColorsLabel];
}

- (void)setSubviewConstraints
{
    
}

#pragma mark -
#pragma mark Private Properties

- (UIImageView *)paletteImageView
{
    if (!_paletteImageView) {
        _paletteImageView = [[UIImageView alloc] init];
        _paletteImageView.contentMode = UIViewContentModeScaleToFill; //default
        _paletteImageView.accessibilityLabel = NSLocalizedString(@"Palette Image View Accessibility Label", nil);
    }
    return _paletteImageView;
}

- (UILabel *)paletteNameLabel
{
    if (!_paletteNameLabel) {
        _paletteNameLabel = [UILabel labelWithStyle:TMLabelStyle_ColorName];
        _paletteNameLabel.accessibilityLabel = NSLocalizedString(@"Palette Name Label Accessibility Label", nil);
    }
    return _paletteNameLabel;
}

- (UILabel *)numberOfColorsLabel
{
    if (!_numberOfColorsLabel) {
        _numberOfColorsLabel = [UILabel labelWithStyle:TMLabelStyle_HexString];
        _numberOfColorsLabel.accessibilityLabel = NSLocalizedString(@"Number of Colors Label Accessibility Label", nil);
    }
    return _numberOfColorsLabel;
}

@end
