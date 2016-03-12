//
//  ArrayDataSource.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "ArrayDataSource.h"

@implementation ArrayDataSource

#pragma mark -
#pragma mark Init

- (instancetype)init
{
    return nil;
}

- (instancetype)initWithArray:(NSArray *)array cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(CellConfigureBlock)configureCellBlock
{
    self = [super init];
    if (self) {
        _array = array;
        _cellIdentifier = cellIdentifier;
        _configureCellBlock = [configureCellBlock copy];
        
        if (!_cellIdentifier) {
            MMJLog(@"Error need to give CellIdentifier!");
            return nil;
        }
    }
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.array count] > indexPath.row) {
        return self.array[(NSUInteger) indexPath.row];
    }
    return nil;
}

#pragma mark Override if Needed

- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView defaultCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView defaultCellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

#pragma mark -
#pragma mark Public Properties

- (void)setArray:(NSArray *)array
{
    if ([array isKindOfClass:[NSMutableArray class]]) {
        _array = [NSArray arrayWithArray:array];
    } else {
        _array = array;
    }
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView defaultCellForRowAtIndexPath:indexPath];
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self collectionView:collectionView defaultCellForItemAtIndexPath:indexPath];
}

@end
