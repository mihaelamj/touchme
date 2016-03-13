//
//  BaseViewController.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseViewController.h"

//3D Touch Checking
#import "UIViewController+CheckFor3DTouch.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark -
#pragma mark Init

- (instancetype)initWithParams:(NSDictionary *)params modal:(BOOL)modal
{
    self = [super init];
    if (self) {
        _modal = modal;
        _parentController = nil;
        _isEmbeddedController = NO;
        _params = params;
    }
    return self;
}

#pragma mark -
#pragma mark Public Templates

- (void)handleParams
{
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //move content below navigation bar
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self handleParams];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //check for 3D Touch
    [self checkAndApply3DTouch:self.previewingContext];
}

@end
