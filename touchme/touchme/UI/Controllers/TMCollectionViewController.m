//
//  TMCollectionViewController.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "TMCollectionViewController.h"

//main view
#import "TMCollectionView.h"

@interface TMCollectionViewController ()

@property (nonatomic, strong) TMCollectionView *mainView;

@end

@implementation TMCollectionViewController

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

- (TMCollectionView *)mainView
{
    if (!_mainView) {
        _mainView = [[TMCollectionView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    }
    return _mainView;
}

@end
