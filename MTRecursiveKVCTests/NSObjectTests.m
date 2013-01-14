//
//  NSObjectTests.m
//  MTRecursiveKVC
//
//  Created by Maximilian Tagher on 1/12/13.
//  Copyright 2013 Max. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "Person.h"
#import "NSObject+RecursiveKVC.h"

SPEC_BEGIN(NSObjectTests)

describe(@"On a non-collection class", ^{
    
    __block Person *person = nil;
    __block Person *father = nil;
    __block Person *grandfather = nil;
    
    beforeEach(^{
        person = [[Person alloc] initWithName:@"Root"];
        father = [[Person alloc] initWithName:@"Dad"];
        grandfather = [[Person alloc] initWithName:@"Grandfather"];
    });
    
    context(@"When the person has no father (no chain)", ^{
        it(@"should return an empty array", ^{
            [[[person recursiveValueForKey:@"father"] should] beEmpty];
        });
    });
    
    context(@"When the person has a father in the chain", ^{
        beforeEach(^{
            person.father = father;
        });
        
        it(@"should have just the father in the array", ^{
            [[[person recursiveValueForKey:@"father"] should] contain:father];
        });
        
        
        context(@"When the person has a grandfather", ^{
            beforeEach(^{
                father.father = grandfather;
            });
            
            it(@"should have the father and grand father in the array", ^{
                [[[person recursiveValueForKey:@"father"] should] containObjectsInArray:@[father, grandfather]];
            });
            
            it(@"Should have the grandfather in the father's array", ^{
                [[[person recursiveValueForKey:@"father"] should] contain:grandfather];
            });
            
        });
    });
    
    
});

SPEC_END


