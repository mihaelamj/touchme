//
//  TMTableViewController.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "TMTableViewController.h"

//main View
#import "TMTableView.h"

//data source
#import "ArrayDataSource.h"

@interface TMTableViewController ()

@property (nonatomic, strong) TMTableView *mainView;

- (void)refreshDataSource;

@end

@implementation TMTableViewController

#pragma mark -
#pragma mark Public Templates

- (UIScrollView *)scrollView
{
    return self.mainView.tableView;
}

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
    
    self.view.backgroundColor = [UIColor whiteColor];
}


#pragma mark -
#pragma mark Private Properties

#pragma mark View

- (TMTableView *)mainView
{
    if (!_mainView) {
        _mainView = [[TMTableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    }
    return _mainView;
}

@end
