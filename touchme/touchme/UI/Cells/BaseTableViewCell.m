//
//  BaseTableViewCell.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface BaseTableViewCell ()

@end

@implementation BaseTableViewCell

#pragma mark -
#pragma mark Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self) {
        [self beforeAddCustomSubviews];
        [self addCustomSubviews];
        [self setSubviewConstraints];
    }
    return self;
}

#pragma mark -
#pragma mark Public Template

+ (Class)cellSubviewClass
{
    return nil;
}

- (void)beforeAddCustomSubviews
{
}

#pragma mark Layout

- (void)addCustomSubviews
{
    if (self.cellContentView) {
        [self.contentView addSubview:self.cellContentView];
    }
}

- (void)setSubviewConstraints
{
    if (self.cellContentView) {
        //occupy the whole area, with offsets
        [self.cellContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.top.equalTo(self.contentView.mas_top);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
    }
}

#pragma mark Data

- (void)customize:(id)customObject
{
    if (self.cellContentView) {
        [self.cellContentView customize:customObject];
    }
}

- (void)cleanView
{
    if (self.cellContentView) {
        [self.cellContentView cleanView];
    }
}

#pragma mark Static

+ (NSString *)reuseIdentifier
{
    NSString *reuseID = [NSString stringWithFormat:@"%@-%@", NSStringFromClass([self class]), @"TableCellID"];
    return reuseID;
}

+ (CGFloat)recomendedCellHeight
{
    Class contentClass = [self cellSubviewClass];
    if (contentClass) {
        return [contentClass recomendedHeight];
    }
    
    return 0;
}

#pragma mark -
#pragma mark Framework Overrides

- (void)prepareForReuse
{
    [self cleanView];
    [super prepareForReuse];
}

#pragma mark -
#pragma mark Properties

- (CellSubview *)cellContentView
{
    if (!_cellContentView) {
        Class contentClass = [self.class cellSubviewClass];
        if (contentClass) {
            _cellContentView = [[contentClass alloc] initWithOptions:LayoutOptions_Horizontal];
        }
    }
    return _cellContentView;
}


@end
