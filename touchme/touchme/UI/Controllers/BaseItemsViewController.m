//
//  BaseItemsViewController.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 13/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseItemsViewController.h"

@interface BaseItemsViewController ()

@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation BaseItemsViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupScrollView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadItems];
}

#pragma mark Helper

- (void)setupScrollView
{
    if ([self.scrollView isKindOfClass:[UITableView class]]) {
        
        UITableView *tv = (UITableView *)self.scrollView;
        
        if (self.cellClass) {
            [tv registerClass:self.cellClass forCellReuseIdentifier:[self.cellClass reuseIdentifier]];
        }
        
        tv.dataSource = self.dataSource;
        tv.delegate = self.delegate;
        
    } else if ([self.scrollView isKindOfClass:[UICollectionView class]]) {
        
        UICollectionView *cv = (UICollectionView *)self.scrollView;
        
        if (self.cellClass) {
            [cv registerClass:self.cellClass forCellWithReuseIdentifier:[self.cellClass reuseIdentifier]];
        }
        
        cv.dataSource = self.dataSource;
        cv.delegate = self.delegate;
    }
}

#pragma mark -
#pragma mark Public Templates

- (UIScrollView *)scrollView
{
    NSAssert(NO, @"Subclasses of BaseScrollViewController must overwrite the scrollView method");
    return nil;
}

- (void)handleParams
{
    if (!self.params) {
        return;
    }
    [super handleParams];
    self.storeClass = self.params[TMKEY_STORE_CLASS];
    self.cellClass = self.params[TMKEY_CELL_CLASS];
    self.modelClass = self.params[TMKEY_MODEL_CLASS];
    
    NSArray *items = self.params[TMKEY_PARENT_ITEMS];
    if ([items isKindOfClass:[NSArray class]]) {
        self.objects = items;
    }
}

#pragma mark -
#pragma mark Loading

- (void)loadItems
{
    if ([self.objects count]) {
        [self refreshProtocol];
        return;
    }
    
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
        
        [self refreshProtocol];
        
    } controller:self];
}

- (void)refreshProtocol
{
    self.dataSource.array = self.objects;
    self.delegate.array = self.objects;
    [self refreshScrollView];
}

#pragma mark Helper

- (void)refreshScrollView
{
    if ([self.scrollView isKindOfClass:[UITableView class]]) {
        UITableView *tv = (UITableView *)self.scrollView;
        [tv reloadData];
    } else if ([self.scrollView isKindOfClass:[UICollectionView class]]) {
        UICollectionView *cv = (UICollectionView *)self.scrollView;
        [cv reloadData];
    }
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

- (ArrayDelegate *)delegate
{
    if (!_delegate) {
        _delegate = [[ArrayDelegate alloc] initWithArray:self.objects cellClass:self.cellClass];
    }
    return _delegate;
    
}

@end
