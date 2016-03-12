//
//  TMCollectionViewController.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 12/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "TMCollectionViewController.h"

@interface TMCollectionViewController ()

@end

@implementation TMCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set title
    self.title = NSLocalizedString(@"TMCollectionViewController Title", @"");
    self.view.accessibilityLabel = NSLocalizedString(@"TMCollectionViewController View Accessibility Label", @"");
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
