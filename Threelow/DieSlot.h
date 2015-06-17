//
//  Die.h
//  Threelow
//
//  Created by Josh Endter on 6/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DieSlot : NSObject

@property (strong, nonatomic) NSNumber *value;
@property (nonatomic, assign) BOOL isHeld;
@property (nonatomic, assign) BOOL isHoldableThisRound;

- (void)rollDie;

@end
