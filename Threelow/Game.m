//
//  Game.m
//  Threelow
//
//  Created by Josh Endter on 6/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "Game.h"

@implementation Game

- (instancetype)init
{
    self = [self initWithDieSlots:5];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithDieSlots:(NSInteger)numOfSlots
{
    self = [super init];
    if (self) {
        
        NSMutableArray *mutableDieSlots = [NSMutableArray new];
        _dieSlots = [NSMutableArray new];
        for (int counter = 0; counter < numOfSlots; counter++) {
            DieSlot *newDieSlot = [[DieSlot alloc] init];
            [mutableDieSlots addObject:newDieSlot];
        }
        
        _dieSlots = [[NSArray alloc] initWithArray:mutableDieSlots];
        _highScore = 30;
    }
    return self;
}

- (void)rollDice
{
    int numOfHeldDie = 0;
    int numOfHoldableDie = 0;
    int numOfDieWithValues = 0;
    
    for (DieSlot *dieSlot in self.dieSlots) {
        if (dieSlot.isHeld) {
            numOfHeldDie++;
        }
        
        if (dieSlot.isHoldableThisRound) {
            numOfHoldableDie++;
        }
        
        if (dieSlot.value) {
            numOfDieWithValues++;
        }
    }
    
    //NSLog(@"Held Die: %d Holdable Die %d", numOfHeldDie, numOfHoldableDie);
    
    if (
        numOfHeldDie + numOfHoldableDie > self.dieSlots.count ||
        numOfDieWithValues == 0
        ) {
            // If the player has picked at least one die OR
            // there are no dice (the game has not yet begun OR
            int counter = 0;
            for (DieSlot *dieSlot in self.dieSlots) {
                if (!dieSlot.isHeld) {
                    [dieSlot rollDie];
                } else {
                    dieSlot.isHoldableThisRound = NO;
                }
                counter++;
            }
        }
    
}

- (void)endGame
{
    int counter = 0;
    for (DieSlot *dieSlot in self.dieSlots) {
        if (!dieSlot.isHeld) {
            [dieSlot rollDie];
        } else {
            dieSlot.isHoldableThisRound = NO;
        }
        
        counter++;
    }
}

@end
