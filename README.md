# TouchMe
3D Touch Demo in Objective C

#Implementing 3D Touch in Objective C

First we need to check for 3D Touch availability.

##Check for 3D Touch availability

That is best done in categories on UIViewController and UIApplication.

###UIApplication

```objective-c
+ (BOOL)hasUIApplicationShortcutItemClass
{
    Class appShortcutItemClas = [UIApplicationShortcutItem class];
    
    if (appShortcutItemClas && [appShortcutItemClas respondsToSelector:@selector(new)]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isThreeDTouchDevice
{
    if (![UIApplication hasUIApplicationShortcutItemClass]) {
        return NO;
    }
    
    //check for trait collection
    UITraitCollection *traitCollection = [UIScreen mainScreen].traitCollection;
    BOOL hasForceTouch = traitCollection && [traitCollection respondsToSelector:@selector(forceTouchCapability)];
    if (hasForceTouch) {
        BOOL forceTouchAvailable = traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable;
        return forceTouchAvailable;
    }
    
    return NO;
}
```

###UIViewController

```objective-c
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
```

I also add a previewingContext property on my base View Controller, to be able to react to 3D touch availability changing (like if the user disables it).

```objective-c
@interface BaseViewController : UIViewController

@property (nonatomic, strong) id previewingContext;

@end
```

And use it in `viewDidAppear`

```objective-c
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //check for 3D Touch
    [self checkAndApply3DTouch:self.previewingContext];
}
```

This way, all view controllers that inherit from `BaseViewController` will be registered previewing, if they have that ability.

This is one example where inheritance is a good usecase in Objective C.




