//
//  TMTableViewController.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "TMTableViewController.h"

@interface TMTableViewController ()

@end

@implementation TMTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set title
    self.title = NSLocalizedString(@"TMTableViewController Title", @"");
    self.view.accessibilityLabel = NSLocalizedString(@"TMTableViewController View Accessibility Label", @"");
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
