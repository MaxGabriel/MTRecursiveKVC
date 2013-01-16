//
//  NSObject+RecursiveKVC.m
//  Categories
//
//  Created by Maximilian Tagher on 1/10/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import "NSObject+RecursiveKVC.h"

@implementation NSObject (RecursiveKVC)

- (NSArray *)recursiveValueForKey:(NSString *)key
{
    NSMutableArray *progress = [NSMutableArray array];
    [[self valueForKey:key] MTrecursiveValueForKey:key progress:progress];
    return progress;
}

- (void)MTrecursiveValueForKey:(NSString *)key progress:(NSMutableArray *)progress
{
    if ([self valueForKey:key]) {
        [progress addObject:self];
        [[self valueForKey:key] MTrecursiveValueForKey:key progress:progress];
    } else {
        [progress addObject:self];
    }
}


@end
