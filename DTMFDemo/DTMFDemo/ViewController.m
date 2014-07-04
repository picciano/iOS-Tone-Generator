//
//  ViewController.m
//  DTMFDemo
//
//  Created by Simon Grätzer on 04.07.14.
//  Copyright (c) 2014 Simon Grätzer. All rights reserved.
//

#import "ViewController.h"
#import "TGSineWaveToneGenerator.h"

@implementation ViewController {
    TGSineWaveToneGenerator *_generator;
}
            
- (void)viewDidLoad {
    [super viewDidLoad];
    _generator = [[TGSineWaveToneGenerator alloc] initWithChannels:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makeSound:(UIButton *)sender {
    [_generator playForDuration:0.3];
}
@end
