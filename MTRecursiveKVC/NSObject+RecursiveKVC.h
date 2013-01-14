//
//  NSObject+RecursiveKVC.h
//  Categories
//
//  Created by Maximilian Tagher on 1/10/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RecursiveKVC)

- (NSArray *)recursiveValueForKey:(NSString *)key;

@end
