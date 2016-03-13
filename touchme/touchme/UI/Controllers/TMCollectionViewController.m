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

//base collection Cell
#import "BaseCollectionViewCell.h"

//base store class
#import "BaseStore.h"

@interface TMCollectionViewController ()

@property (nonatomic, strong) TMCollectionView *mainView;

@property (nonatomic, unsafe_unretained, readwrite) Class cellClass;
@property (nonatomic, unsafe_unretained, readwrite) Class storeClass;

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
#pragma mark Public Templates

- (void)handleParams
{
    if (!self.params) {
        return;
    }
    
    self.storeClass = self.params[TMKEY_STORE_CLASS];
    self.cellClass = self.params[TMKEY_CELL_CLASS];
    self.title = self.params[TMKEY_VIEW_CONTROLLER_TITLE];;
    self.view.accessibilityLabel = self.params[TMKEY_VIEW_ACCSESSIBILITY_LABEL];
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
