//
//  NSObject+RecursiveKVC.h
//  Categories
//
//  Created by Maximilian Tagher on 1/10/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Adds recursive lookup to traditional Key-Value Coding  */
@interface NSObject (RecursiveKVC)

/** Returns the result of recursively invoking `valueForKey:` on each returned object until it reaches a `nil` value.
 
 @param key The name of one of the receiver's properties.
 @return The objects returned by recursively calling the `valueForKey:` method on objects returned by `valueForKey:`
 */
- (NSArray *)recursiveValueForKey:(NSString *)key;

@end
