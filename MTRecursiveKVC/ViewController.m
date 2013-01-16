//
//  ViewController.m
//  MTRecursiveKVC
//
//  Created by Maximilian Tagher on 1/12/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+RecursiveKVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *root = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *a1 = [[UIView alloc] initWithFrame:CGRectZero];
    a1.tag = 1;
    UIView *a2 = [[UIView alloc] initWithFrame:CGRectZero];
    a2.tag = 2;
    UIView *b2 = [[UIView alloc] initWithFrame:CGRectZero];
    b2.tag = 3;
    
    [self.view addSubview:root];
    [root addSubview:a1];
    [root addSubview:a2];
    [a2 addSubview:b2];
    
    NSArray *test = [root recursiveValueForKey:@"subviews"];
    NSLog(@"The complete set of subviews = %@",test);
    
}


@end
