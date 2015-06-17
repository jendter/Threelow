//
//  Game.h
//  Threelow
//
//  Created by Josh Endter on 6/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DieSlot.h"

@interface Game : NSObject

@property (nonatomic, strong) NSArray *dieSlots;
@property (nonatomic) int highScore;

- (instancetype)initWithDieSlots:(NSInteger)numOfSlots;
- (void)rollDice;
- (void)endGame;

@end
