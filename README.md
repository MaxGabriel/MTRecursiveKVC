MTRecursiveKVC
==============

A small category on `NSObject` that adds support for recursive lookup using `valueForKey:`:
```objc
NSArray *superviewChain = [view recursiveValueForKey:@"superview"]; 
// Recursively gets the superview property until it is nil 
```


Like the traditional `valueForKey:` method, when used on collection classes (`NSArray`, `NSSet`, and `NSOrderedSet`) it applies the method to each of the objects inside the collection.
```objc
NSArray *allSubviews = [view recursiveValueForKey:@"subviews"]; 
// Returns all the subviews of a view, and all their subviews, and all their subviews, etc. in a flat array
```
    
Practical Usage Example
-------------

When a `UITableViewCell` is highlighted, it attempts to highlight all of its subviews as well. This behavior looks nice for labels, but typically looks poor when applied to buttons. The code below overrides the default behavior to not highlight the buttons.

```objc
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if (highlighted) {
        [super setHighlighted:highlighted animated:animated];
        
        NSArray *recursiveAllSubviews = [self recursiveValueForKey:@"subviews"];
        
        for (UIView *subview in recursiveAllSubviews) {
            if ([subview isKindOfClass:[UIButton class]]) {
                [subview setValue:[NSNumber numberWithBool:NO] forKey:@"highlighted"];
            }
        }
    } else {
        [super setHighlighted:highlighted animated:(BOOL)animated];
    }
}
```
(Note: You would need the same code in `setSelected:animated:` in actual usage).

Installation
-------------

###Cocoapods

[Cocoapods](http://cocoapods.org/) is the recommended installation method:

1. Install CocoaPods
```sh
[sudo] gem install cocoapods
pod setup
```

2. Make a file with no extension named `Podfile`
```sh
touch Podfile
```

3. Configure the Podfile
```ruby
platform :ios
pod 'MTRecursiveKVC'
```

###Drag-n-Drop

Simply drag in the 4 categories in the project.

Documentation
-------------

Full API documentation is available on [CocoaDocs](http://cocoadocs.org/docsets/MTRecursiveKVC/).

If you install MTRecursiveKVC using Cocoapods, Cocoapods will automatically add the documentation to Xcode for you if you have Appledoc installed.

You can also install documentation locally using Appledoc. I use the following command to generate documentation for it:

    appledoc --project-name MTRecursiveKVC --project-company "Maximilian Tagher" --company-id com.tagher.rkvc --ignore "*.m" --no-repeat-first-par --docset-platform-family iphoneos --output ~/help .


Project Status
-------------

I consider this project **complete** -- it's unit-tested, documented, and I use it in production. The limited scope of this project means you shouldn't be too concerned about the lack of pull requests.

If you find any bugs, you can start an [issue](https://github.com/MaxGabriel/MTRecursiveKVC/issues). If you use `MTRecursiveKVC`, I'd be happy to hear about it on [Twitter](https://twitter.com/MaxTagher).


Contributing
------------

MTRecursiveKVC is tested using the Kiwi BDD framework. You can use Cocoapods to set it up:

1. Install Cocoapods: Follow the instructions here to install: http://cocoapods.org/ For a good introduction, check out this screencast: http://nsscreencast.com/episodes/28-creating-a-cocoapod

2. Run pod install

3. Open the .xcworkspace file.
