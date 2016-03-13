//
//  BaseTableViewCell.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseTableViewCell.h"

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

- (void)beforeAddCustomSubviews
{
}

#pragma mark Layout

- (void)addCustomSubviews
{
}

- (void)setSubviewConstraints
{
}

#pragma mark Data

- (void)customize:(id)customObject
{
}

- (void)cleanView
{
}

#pragma mark Static

+ (NSString *)reuseIdentifier
{
    NSString *reuseID = [NSString stringWithFormat:@"%@-%@", NSStringFromClass([self class]), @"TableCellID"];
    return reuseID;
}

+ (CGFloat)recomendedCellHeight
{
    return 0;
}

#pragma mark -
#pragma mark Framework Overrides

- (void)prepareForReuse
{
    [self cleanView];
    [super prepareForReuse];
}

@end
