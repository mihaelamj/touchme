//
//  HomeViewController.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set title
    self.title = NSLocalizedString(@"HomeViewController Title", @"");
    
    self.view.accessibilityLabel = NSLocalizedString(@"HomeViewController View Accessibility Label", @"");;
    
    self.view.backgroundColor = [UIColor redColor];
}

@end
