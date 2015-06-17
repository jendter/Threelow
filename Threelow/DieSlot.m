//
//  Die.m
//  Threelow
//
//  Created by Josh Endter on 6/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "DieSlot.h"

@implementation DieSlot

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isHeld = NO;
        _isHoldableThisRound = YES;
    }
    return self;
}

- (void)rollDie
{
    int randomDieNum = arc4random_uniform(6)+1;
    self.value = [NSNumber numberWithInt:randomDieNum];
}

@end
