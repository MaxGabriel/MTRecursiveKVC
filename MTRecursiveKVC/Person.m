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
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Person object: %@",self.name];
}

@end
