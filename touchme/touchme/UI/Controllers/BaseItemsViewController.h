//
//  BaseItemsViewController.h
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseViewController.h"

//base cell classes
#import "BaseTableViewCell.h"
#import "BaseCollectionViewCell.h"

//data source
#import "ArrayDataSource.h"

//base store class
#import "BaseStore.h"

@interface BaseItemsViewController : BaseViewController

@property (nonatomic, unsafe_unretained, readwrite) Class cellClass;
@property (nonatomic, unsafe_unretained, readwrite) Class storeClass;
@property (nonatomic, unsafe_unretained, readwrite) Class modelClass;

@property (nonatomic, strong) NSArray *objects;
//data source
@property (nonatomic, strong) ArrayDataSource *dataSource;

- (void)loadItems;
- (void)refreshDataSource;

@end
