//
//  NSSetRecursiveKVCSpecs.m
//  MTRecursiveKVC
//
//  Created by Maximilian Tagher on 1/14/13.
//  Copyright 2013 Max. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "Person.h"
#import "NSObject+RecursiveKVC.h"


SPEC_BEGIN(NSSetRecursiveKVCSpecs)

describe(@"On an NSArray", ^{
    
    __block Person *root = nil;
    __block Person *a1 = nil;
    __block Person *a2 = nil;
    __block Person *b1 = nil;
    __block Person *b2 = nil;
    beforeEach(^{
        root = [[Person alloc] initWithName:@"Root"];
        a1 = [[Person alloc] initWithName:@"a1"];
        a2 = [[Person alloc] initWithName:@"a2"];
        b1 = [[Person alloc] initWithName:@"b1"];
        b2 = [[Person alloc] initWithName:@"b2"];
        
        NSArray *people = @[root, a1, a2, b1, b2];
        
        for (Person *person in people) {
            person.collectionType = ParentCollectionTypeSet;
        }
    });
    
    context(@"When the person has no parents", ^{
        it(@"should return an empty array", ^{
            [[[root recursiveValueForKey:@"parents"] should] beEmpty];
        });
    });
    
    context(@"When the person has an empty array as parents", ^{
        beforeEach(^{
            root.parents = @[];
        });
        it(@"should return an empty array", ^{
            [[[root recursiveValueForKey:@"parents"] should] beEmpty];
        });
    });
    
    context(@"When the person has one parent", ^{
        beforeEach(^{
            root.parents = @[a1];
        });
        it(@"should return just a1", ^{
            [[[root recursiveValueForKey:@"parents"] should] contain:a1];
        });
    });
    
    context(@"When a1 has a parent", ^{
        beforeEach(^{
            root.parents = @[a1];
            a1.parents = @[b1];
        });
        it(@"root should have a1 and b1", ^{
            [[[root recursiveValueForKey:@"parents"] should] containObjectsInArray:@[a1,b1]];
        });
        it(@"a1 should have just b1", ^{
            [[[root recursiveValueForKey:@"parents"] should] contain:b1];
        });
    });
    
    context(@"When root has two parents", ^{
        beforeEach(^{
            root.parents = @[a1,a2];
        });
        it(@"should have a1 and a2", ^{
            [[[root recursiveValueForKey:@"parents"] should] containObjectsInArray:@[a1,a2]];
        });
    });
    
    context(@"When each of root's parent's has a parent", ^{
        beforeEach(^{
            root.parents = @[a1,a2];
            a1.parents = @[b1];
            a2.parents = @[b2];
        });
        it(@"should have a1, a2, b1, b2", ^{
            [[[root recursiveValueForKey:@"parents"] should] containObjectsInArray:@[a1,a2,b1,b2]];
        });
    });
    
    
});

SPEC_END


