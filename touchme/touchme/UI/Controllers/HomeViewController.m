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

@interface HomeViewController ()

@property (nonatomic, strong) HomeView *mainView;

//items
@property (nonatomic, strong) NSArray *items;

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

#pragma mark View

- (HomeView *)mainView
{
    if (!_mainView) {
        _mainView = [[HomeView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    }
    return _mainView;
}

@end
