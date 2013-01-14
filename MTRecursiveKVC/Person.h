//
//  Person.h
//  MTRecursiveKVC
//
//  Created by Maximilian Tagher on 1/12/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) Person *father;
@property (nonatomic, strong, readonly) NSString *name;

@property (nonatomic, strong) NSArray *parents;

- (Person *)initWithName:(NSString *)name;

@end
