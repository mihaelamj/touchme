//
//  ArrayDelegate.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "ArrayDelegate.h"

//base cell classes
#import "BaseTableViewCell.h"
#import "BaseCollectionViewCell.h"

@implementation ArrayDelegate

#pragma mark -
#pragma mark Init

- (instancetype)init
{
    return nil;
}

- (instancetype)initWithArray:(NSArray *)array cellClass:(Class)cellClass;
{
    self = [super init];
    if (self) {
        _array = array;
        _cellClass = cellClass;
    }
    return self;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellClass recomendedCellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self doItemAction:indexPath];
}

#pragma mark -
#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self doItemAction:indexPath];
}

#pragma mark -
#pragma mark UICollectionViewDelegateFlowLayout

//measuring cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellClass recomendedCellSize];
}

#pragma mark -
#pragma mark Private Methods

- (BaseItem *)baseItemAtIndexPath:(NSIndexPath *)indexPath
{
    BaseItem *item = nil;
    if ([self.array count] > indexPath.row) {
        item = self.array[(NSUInteger) indexPath.row];
    }
    if ([item isKindOfClass:[BaseItem class]]) {
        return item;
    }
    return nil;
}

- (void)doItemAction:(NSIndexPath *)indexPath
{
    BaseItem *item = [self baseItemAtIndexPath:indexPath];
    
    if (item) {
        if (item.actionBlock) {
            item.actionBlock();
        } else {
            MMJLog(@"Error: no actionBlock for item at index: %ld", (long)indexPath.row);
        }
    } else {
        MMJLog(@"Error: no item at index: %ld", (long)indexPath.row);
    }
}

@end
