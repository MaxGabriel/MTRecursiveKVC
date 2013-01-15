//
//  NSObject+RecursiveKVC.h
//  Categories
//
//  Created by Maximilian Tagher on 1/10/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RecursiveKVC)

/** Returns the result of recursively calling `valueForKey:` on each returned object until it reaches a `nil` value.
 
 Applies the standard `valueForKey:` method recursively along a chain of objects.
 Recursively applies `valueForKey:` to the receiver.
 Returns a recursive
 Returns the result of `valueForKey:`
 
 'and then recursively applies the method until it reaches a `nil` value'
 
 @param key The name of one of the receiver's properties.
 @return The objects returned by recursively calling the `valueForKey:` method on objects returned by `valueForKey:`
 
 The result of recursively calling `valueForKey:`

 
 */

- (NSArray *)recursiveValueForKey:(NSString *)key;

@end
