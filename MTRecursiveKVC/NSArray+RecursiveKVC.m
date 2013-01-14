//
//  NSArray+RecursiveKVC.m
//  Categories
//
//  Created by Maximilian Tagher on 1/11/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import "NSArray+RecursiveKVC.h"
#import "NSObject+RecursiveKVC.h"

@implementation NSArray (RecursiveKVC)

- (void)RKCVrecursiveValueForKey:(NSString *)key progress:(NSMutableArray *)progress
{
    for (id obj in self) {
        [obj RKCVrecursiveValueForKey:key progress:progress];
    }
}

@end
