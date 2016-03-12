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

I also add a `previewingContext` property on my `BaseViewController`, to be able to react to 3D touch availability changing (like if the user disables it).

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

##Basic Application Structure and idioms
* Each UI object comes from basic class, like `BaseViewController`, `BaseView` and so on.
* For cells I use a base `CellSubview` class that goes in cell's `ContentView`, for tables and collections respectively.
* Each container view (table or collection) uses `DataSource` and `Delegate` objects implemented outside of that container's view implementation.
* For routing, there is `Router` class that handles that. It takes into account whether a `ViewController` is modal, or should it be put into `Navigation stack`.
* Each enum ends with a count enum


```objective-c
typedef NS_ENUM(NSInteger, HomeItemType) {
    HomeItemType_TableView = 0,
    HomeItemType_CollectionView,
    HomeItemType_View,
    HomeItemType_Count
};
```
* All enums have a corresponding NSString category for their respective object's string properties.

##Adding Quick Actions

Quick Actions enable user  to quickly jump into a specific section of the app just by pressing down on the app icon. 

There are two kinds of Quick Actions:

* Static defined in `Info.plist` in `UIApplicationShortcutItems` array.
* Dynamic, created in code.

Both types of quick action can display up to two lines of text along with an optional icon.

###Static Actions

Static Actions have one advantage over dynamic ones that they are available immediately. 
Dynamic actions require that the application is run at leat once.


###Dynamic Actions
They allow you to add actions that are specific to the user.
Like the last image they took or similar.
If the user took no images, that action can be removed.



