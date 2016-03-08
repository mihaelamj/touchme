//
//  UIViewController+CheckFor3DTouch.m
//  touchme
//
//  Created by Mihaela Mihaljevic Jakic on 08/03/16.
//  Copyright © 2016 Mihaela Mihaljevic Jakic. All rights reserved.
//

#import "UIViewController+CheckFor3DTouch.h"

//3D touch checking
#import "UIApplication+ThreeDSupport.h"

@implementation UIViewController (CheckFor3DTouch)

#pragma mark -
#pragma mark Public Methods

- (void)checkAndApply3DTouch:(id)previewingContext
{
    // register for 3D Touch (if available)
    if ([UIApplication isThreeDTouchDevice]) {
        previewingContext = [self registerForPreviewingWithDelegate:(id)self sourceView:self.view];
        MMJLog(@"3D Touch is available! :)!");
    } else {
        if (previewingContext) {
            [self unregisterForPreviewingWithContext:previewingContext];
            previewingContext = nil;
        }
        MMJLog(@"3D Touch is not available on this device. :( !");
    }
}

@end
