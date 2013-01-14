//
//  ViewController.m
//  MTRecursiveKVC
//
//  Created by Maximilian Tagher on 1/12/13.
//  Copyright (c) 2013 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 50)];
    label.text = @"Varying text length here. It gets really really really long and wraps to the next line";
    label.numberOfLines = 0;
    [label sizeToFit];
    [self.view addSubview:label];
    NSLog(@"Label's frame = %@",NSStringFromCGRect(label.frame));
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectOffset(label.frame, 0, CGRectGetHeight(label.frame)+0)];
    label2.text = @"This one is unpredictably shorter!";
    label2.numberOfLines = 0;
    [label2 sizeToFit];
    [self.view addSubview:label2];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
