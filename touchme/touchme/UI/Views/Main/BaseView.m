//
//  BaseView.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

#pragma mark -
#pragma mark Init

- (instancetype)init;
{
    self = [super init];
    if (self) {
        self.accessibilityLabel = NSStringFromClass([self class]);
    }
    return self;
}

@end
