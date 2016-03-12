//
//  TMPlainViewController.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "TMPlainViewController.h"

@interface TMPlainViewController ()

@end

@implementation TMPlainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set title
    self.title = NSLocalizedString(@"TMPlainViewController Title", @"");
    self.view.accessibilityLabel = NSLocalizedString(@"TMPlainViewController View Accessibility Label", @"");
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
