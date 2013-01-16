//
//  Person.m
//  MTRecursiveKVC
//
//  Created by Maximilian Tagher on 1/12/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import "Person.h"

@interface Person()

@property (nonatomic, strong) NSString *name;

@end

@implementation Person

- (Person *)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
        self.collectionType = ParentCollectionTypeArray;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Person object: %@",self.name];
}
//
- (NSArray *)parents
{
//    return _parents;
    
    switch (self.collectionType) {
        case ParentCollectionTypeArray:
            return _parents;
            break;
        case ParentCollectionTypeOrderedSet:
            return [NSOrderedSet orderedSetWithArray:_parents];
            break;
        case ParentCollectionTypeSet:
            return [NSSet setWithArray:_parents];
            break;
        default:
            return _parents;
            break;
    }
}

@end
