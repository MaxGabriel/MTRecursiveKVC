MTRecursiveKVC
==============

A small category on `NSObject` that adds support for recursive lookup using `valueForKey:`:

    NSArray *superviewChain = [view recursiveValueForKey:@"superview"]; 
    // Recursively gets the superview property until it is nil 


Like the traditional `valueForKey:` method, when used on collection classes (`NSArray`, `NSSet`, and `NSOrderedSet`) it applies the method to each of the objects inside the collection.

    NSArray *allSubviews = [view recursiveValueForKey:@"subviews"]; 
    // Returns all the subviews of a view, and all their subviews, and all their subviews, etc. 
