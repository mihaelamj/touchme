//
//  BaseItemsViewController.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseItemsViewController.h"

@interface BaseItemsViewController ()

@end

@implementation BaseItemsViewController

#pragma mark -
#pragma mark Public Templates

- (void)handleParams
{
    if (!self.params) {
        return;
    }
    [super handleParams];
    self.storeClass = self.params[TMKEY_STORE_CLASS];
    self.cellClass = self.params[TMKEY_CELL_CLASS];
    self.modelClass = self.params[TMKEY_MODEL_CLASS];
}

#pragma mark -
#pragma mark Loading

- (void)loadItems
{
    if (!self.storeClass) {
        return;
    }
    
    [self.storeClass itemsWithCompletion:^(NSArray *array, NSError *error) {
        if (error) {
            MMJLog(@"Error: %@", error);
            self.objects = nil;
        } else {
            self.objects = array;
        }
        
        [self refreshDataSource];
        
    } controller:self];
}

//abstract
- (void)refreshDataSource
{
}

#pragma mark -
#pragma mark Public Properties

- (ArrayDataSource *)dataSource
{
    if (!_dataSource) {
        
        //check
        if (!self.cellClass || !self.modelClass) {
            MMJLog(@"Error: need cellClass and modelClass");
            _dataSource = nil;
            return _dataSource;
        }
        
        //make customize cell bloack
        void (^configureCell)(id cell, id item) = ^(id cell, id item) {
            
            //do the thing with cell
            if ([cell isKindOfClass:[BaseTableViewCell class]]) {
                BaseTableViewCell *tableVC = (BaseTableViewCell *)cell;
                [tableVC customize:item];
            } else if ([cell isKindOfClass:[BaseCollectionViewCell class]]) {
                BaseCollectionViewCell *collectionVC = (BaseCollectionViewCell *)cell;
                [collectionVC customize:item];
            }
        };
        
        _dataSource = [[ArrayDataSource alloc] initWithArray:self.objects cellIdentifier:[self.cellClass reuseIdentifier] configureCellBlock:configureCell];
    }
    
    return _dataSource;
}

@end
