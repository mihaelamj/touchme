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

#define OFFSET_MULTI 5.0f

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
    //image on the right, center
    [self.paletteImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        
        make.height.equalTo(self.mas_height).multipliedBy(0.72);
        make.width.equalTo(self.mas_width).multipliedBy(0.5);
        
//        make.height.equalTo(@(kPaletteImageHeight));
//        make.width.equalTo(@(kPaletteImageWidth));
        make.right.equalTo(self.mas_right).with.offset(-kDefaultCellOffset*OFFSET_MULTI);
    }];
    
    //name on top, left
    [self.paletteNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left).with.offset(kDefaultCellOffset*OFFSET_MULTI);
        make.right.equalTo(self.paletteImageView.mas_left).with.offset(-kDefaultCellOffset*OFFSET_MULTI);
    }];
    
    //number of colors, bottol left
    [self.numberOfColorsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left).with.offset(kDefaultCellOffset*OFFSET_MULTI);
        make.right.equalTo(self.paletteImageView.mas_left).with.offset(-kDefaultCellOffset*OFFSET_MULTI);
    }];
}

#pragma mark Data

- (void)customize:(id)customObject
{
    if (![customObject isKindOfClass:[MMJColorPalette class]]) {
        MMJLog(@"Wrong object class passed to customize cell: expecting %@, got %@", NSStringFromClass([MMJColorPalette class]), NSStringFromClass([customObject class]));
        return;
    }
    
    MMJColorPalette *colorPalette = (MMJColorPalette *)customObject;
    
    self.paletteImageView.image = colorPalette.image;
    self.paletteNameLabel.text = colorPalette.name;
    self.numberOfColorsLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)[colorPalette.colors count]];
}

- (void)cleanView
{
    self.paletteImageView.image = nil;
    self.paletteNameLabel.text = @"";
    self.numberOfColorsLabel.text = @"";
}

#pragma mark Static

+ (CGFloat)recomendedHeight
{
    return kPaletteItemCellHeight;
}

+ (CGFloat)recomendedWidth
{
    return kPaletteItemCellWidth;
}

#pragma mark -
#pragma mark Framework Overrides

#pragma mark Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //make it a circle (here, because we don't know the frame before)
    self.paletteImageView.layer.cornerRadius = 4.0f;
    self.paletteImageView.layer.masksToBounds = YES;
    self.paletteImageView.layer.borderColor = [UIColor colorWithStyle:TMColorStyle_GrayDark].CGColor;
    self.paletteImageView.layer.borderWidth = 1.0f;
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
