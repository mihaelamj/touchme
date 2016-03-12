//
//  ArrayDataSource.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import <Foundation/Foundation.h>

//needed for UITableViewDataSource to be available
#import <UIKit/UIKit.h>

//block types
#import "BlockTypes.h"

@interface ArrayDataSource : NSObject<UITableViewDataSource, UICollectionViewDataSource>

//init
- (instancetype)initWithArray:(NSArray *)array cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(CellConfigureBlock)configureCellBlock;

//public properties
@property (nonatomic, weak) NSArray *array;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) CellConfigureBlock configureCellBlock;

//public methods
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

//for further customization override these
- (NSInteger)numberOfSections;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView defaultCellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView defaultCellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
