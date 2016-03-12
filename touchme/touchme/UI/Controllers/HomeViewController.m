//
//  HomeViewController.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "HomeViewController.h"

//main view
#import "HomeView.h"

//model
#import "HomeItem.h"
//store
#import "HomeItemsStore.h"

//data source
#import "ArrayDataSource.h"

//delegate
#import "HomeViewControllerDelegate.h"

//sizes
#import "TMSizes.h"

//style
#import "UILabel+TMStyle.h"

//cell identifier
static NSString * const kHomeItemCellIdentifier = @"HomeItemCell";

@interface HomeViewController ()

@property (nonatomic, strong) HomeView *mainView;

//items
@property (nonatomic, strong) NSArray *items;

//data source
@property (nonatomic, strong) ArrayDataSource *dataSource;
@property (nonatomic, strong) HomeViewControllerDelegate *delegate;

- (void)setupTableView;

@end

@implementation HomeViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)loadView
{
    //set view
    self.view = self.mainView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set title
    self.title = NSLocalizedString(@"HomeViewController Title", @"");
    
    self.view.accessibilityLabel = NSLocalizedString(@"HomeViewController View Accessibility Label", @"");;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupTableView];
}

#pragma mark -
#pragma mark Setup

- (void)setupTableView
{
    //register cell class
    [self.mainView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kHomeItemCellIdentifier];
    
    //table view row height
    self.mainView.tableView.rowHeight = kHomeItemCellHeight;
    
    //set table view data source and delegate
    self.mainView.tableView.dataSource = self.dataSource;
    self.mainView.tableView.delegate = self.delegate;
}

#pragma mark -
#pragma mark Private Properties

- (NSArray *)items
{
    if (!_items) {
        NSError *error = nil;
        _items = [HomeItemsStore itemsWithError:&error controller:self];
    }
    return _items;
}

- (ArrayDataSource *)dataSource
{
    if (!_dataSource) {
        
        //make customize cell bloack
        void (^configureCell)(UITableViewCell *, HomeItem *) = ^(UITableViewCell *cell, HomeItem *item) {
            //do the thing with cell
            cell.textLabel.text = item.name;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.imageView.image = item.image;
            [cell.textLabel applyStyle:TMLabelStyle_VeryBigTitle];
        };
        _dataSource = [[ArrayDataSource alloc] initWithArray:self.items cellIdentifier:kHomeItemCellIdentifier configureCellBlock:configureCell];
    }
    
    return _dataSource;
}

- (HomeViewControllerDelegate *)delegate
{
    if (!_delegate) {
        _delegate = [[HomeViewControllerDelegate alloc] initWithArray:self.items];
    }
    return _delegate;
}

#pragma mark View

- (HomeView *)mainView
{
    if (!_mainView) {
        _mainView = [[HomeView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    }
    return _mainView;
}

@end
