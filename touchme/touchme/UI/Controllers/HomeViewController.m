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

//data source
#import "ArrayDataSource.h"

//cell identifier
static NSString * const kHomeItemCellIdentifier = @"HomeItemCell";

@interface HomeViewController ()

@property (nonatomic, strong) HomeView *mainView;

//items
@property (nonatomic, strong) NSArray *items;

//data source
@property (nonatomic, strong) ArrayDataSource *dataSource;

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
}

#pragma mark -
#pragma mark Private Properties

- (NSArray *)items
{
    if (!_items) {
        _items = [HomeItem itemArray];
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
        };
        _dataSource = [[ArrayDataSource alloc] initWithArray:self.items cellIdentifier:kHomeItemCellIdentifier configureCellBlock:configureCell];
    }
    
    return _dataSource;
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
