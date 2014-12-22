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

- (IBAction)makeSound:(UIButton *)sender {
    
    unichar c = [[sender titleForState:UIControlStateNormal] characterAtIndex:0];
    
    // DTMF keypad frequencies
    double freqA[] = {1209, 1336, 1477};
    double freqB[] = {697, 770, 852};
    if (c == '0') {
        _generator->_channels[0].frequency = 1336;
        _generator->_channels[1].frequency = 941;
    } else if ('0' < c && c <= '9') {
        c = c -'1';
        _generator->_channels[0].frequency = freqA[c % 3];
        _generator->_channels[1].frequency = freqB[c / 3];
    } else if (c == '#') {
        _generator->_channels[0].frequency = 1477;
        _generator->_channels[1].frequency = 941;
    } else {// Not sure
        _generator->_channels[0].frequency = 1209;
        _generator->_channels[1].frequency = 941;
    }
    [_generator playForDuration:0.5];
}
@end
