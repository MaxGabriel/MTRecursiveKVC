//
//  NSOrderedSet+RecursiveKVC.h
//  MTRecursiveKVC
//
//  Created by Maximilian Tagher on 1/14/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
/** Adds recursive lookup to traditional Key-Value Coding  */
@interface NSOrderedSet (RecursiveKVC)

/** Returns an array containing the results of invoking `recursiveValueForKey:` using `key` on each of the set's objects.
 
 Importantly, this method does not follow the `valueForKey:` approach of adding `NSNull` objects to the returned array when `nil` is returned. It merely does not add these objects to the array.
 
 @param key The key to retrieve.
 @return An array
 */
- (NSArray *)recursiveValueForKey:(NSString *)key;

@end
