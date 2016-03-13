//
//  ColorItemCellSubview.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "ColorItemCellSubview.h"

//model
#import "MMJColorItem.h"

//sizes
#import "TMSizes.h"

#define OFFSET_MULTI 5.0f

@interface ColorItemCellSubview ()

@property (nonatomic, strong) UIImageView *colorImageView;
@property (nonatomic, strong) UILabel *colorNameLabel;
@property (nonatomic, strong) UILabel *hexColorNameLabel;
@property (nonatomic, strong) UILabel *palleteNameLabel;

@end

@implementation ColorItemCellSubview

#pragma mark -
#pragma mark Public Overrides

#pragma mark Layout

- (void)addCustomSubviews
{
    self.backgroundColor = [UIColor colorWithStyle:TMColorStyle_White];
    [self addSubview:self.colorImageView];
    [self addSubview:self.colorNameLabel];
    [self addSubview:self.hexColorNameLabel];
    [self addSubview:self.palleteNameLabel];
}

- (void)setSubviewConstraints
{
    //image on the left, centerd on Y
    [self.colorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(kDefaultCellOffset*OFFSET_MULTI);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height).multipliedBy(0.72);
        make.width.equalTo(self.colorImageView.mas_height).multipliedBy(2.5f);
    }];
    
    [self.colorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.colorImageView.mas_top);
        make.left.equalTo(self.colorImageView.mas_right).with.offset(kDefaultCellOffset*OFFSET_MULTI);
        make.right.equalTo(self.mas_right).with.offset(-kDefaultCellOffset*OFFSET_MULTI);
    }];
    
    [self.hexColorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.colorNameLabel.mas_left);
        make.bottom.equalTo(self.colorImageView.mas_bottom);
    }];
    
    [self.palleteNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.hexColorNameLabel.mas_right).with.offset(kDefaultCellOffset*OFFSET_MULTI);
        make.right.equalTo(self.mas_right).with.offset(-kDefaultCellOffset*OFFSET_MULTI);
    }];
}

#pragma mark Data

- (void)customize:(id)customObject
{
    if (![customObject isKindOfClass:[MMJColorItem class]]) {
        MMJLog(@"Wrong object class passed to customize cell: expecting %@, got %@", NSStringFromClass([MMJColorItem class]), NSStringFromClass([customObject class]));
        return;
    }
    
    MMJColorItem *colorItem = (MMJColorItem *)customObject;
    self.colorImageView.image = colorItem.image;
    self.colorNameLabel.text = colorItem.name;
    self.hexColorNameLabel.text = colorItem.hexString;
    self.palleteNameLabel.text = colorItem.paletteName;
}

- (void)cleanView
{
    self.colorImageView.image = nil;
    self.colorNameLabel.text = @"";
    self.hexColorNameLabel.text = @"";
    self.palleteNameLabel.text = @"";
}

#pragma mark Static

+ (CGFloat)recomendedHeight
{
    return kColorItemCellHeight;
}

+ (CGFloat)recomendedWidth
{
    return kColorItemCellWidth;
}

#pragma mark -
#pragma mark Framework Overrides

#pragma mark Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //make it a circle (here, because we don't know the frame before)
    self.colorImageView.layer.cornerRadius = self.colorImageView.frame.size.height/2.0f;
    self.colorImageView.layer.masksToBounds = YES;
}

#pragma mark -
#pragma mark Private Properties

- (UIImageView *)colorImageView
{
    if (!_colorImageView) {
        _colorImageView = [[UIImageView alloc] init];
        _colorImageView.contentMode = UIViewContentModeScaleToFill; //default
        _colorImageView.accessibilityLabel = NSLocalizedString(@"Color Image View Accessibility Label", nil);
    }
    return _colorImageView;
}

- (UILabel *)colorNameLabel
{
    if (!_colorNameLabel) {
        _colorNameLabel = [UILabel labelWithStyle:TMLabelStyle_ColorName];
        _colorNameLabel.accessibilityLabel = NSLocalizedString(@"Color Name Label Accessibility Label", nil);
    }
    return _colorNameLabel;
}

- (UILabel *)hexColorNameLabel
{
    if (!_hexColorNameLabel) {
        _hexColorNameLabel = [UILabel labelWithStyle:TMLabelStyle_HexString];
        _hexColorNameLabel.accessibilityLabel = NSLocalizedString(@"ColorHex Label Accessibility Label", nil);
    }
    return _hexColorNameLabel;
}

- (UILabel *)palleteNameLabel
{
    if (!_palleteNameLabel) {
        _palleteNameLabel = [UILabel labelWithStyle:TMLabelStyle_PaletteName];
        _palleteNameLabel.accessibilityLabel = NSLocalizedString(@"Palette Name Label Accessibility Label", nil);
    }
    return _palleteNameLabel;
}

@end
