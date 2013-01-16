//
//  Person.h
//  MTRecursiveKVC
//
//  Created by Maximilian Tagher on 1/12/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM( NSUInteger, ParentCollectionType ) {
    ParentCollectionTypeArray,
    ParentCollectionTypeSet,
    ParentCollectionTypeOrderedSet,
};

@interface Person : NSObject

@property (nonatomic, strong) Person *father;
@property (nonatomic, strong, readonly) NSString *name;

@property (nonatomic, strong) NSArray *parents;
@property (nonatomic) ParentCollectionType collectionType;

- (Person *)initWithName:(NSString *)name;

@end
