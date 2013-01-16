MTRecursiveKVC
==============

A small category on `NSObject` that adds support for recursive lookup using `valueForKey:`:

    NSArray *superviewChain = [view recursiveValueForKey:@"superview"]; 
    // Recursively gets the superview property until it is nil 


Like the traditional `valueForKey:` method, when used on collection classes (`NSArray`, `NSSet`, and `NSOrderedSet`) it applies the method to each of the objects inside the collection.

    NSArray *allSubviews = [view recursiveValueForKey:@"subviews"]; 
    // Returns all the subviews of a view, and all their subviews, and all their subviews, etc. 

Documentation
-------------

MTRecursiveKVC is documented using Appledoc syntax. I use the following command to generate documentation for it:

    appledoc --project-name MTRecursiveKVC --project-company "Maximilian Tagher" --company-id com.tagher.rkvc --ignore "*.m" --no-repeat-first-par --docset-platform-family iphoneos --output ~/help .

If you install MTRecursiveKVC using Cocoapods, Cocoapods will automatically generate the documentation for you if you have Appledoc installed.


Contributing
------------

MTRecursiveKVC is tested using the Kiwi BDD framework. You can use Cocoapods to set it up:

1. Install Cocoapods: Follow the instructions here to install: http://cocoapods.org/ For a good introduction, check out this screencast: http://nsscreencast.com/episodes/28-creating-a-cocoapod

2. Run pod install

3. Open the .xcworkspace file.
