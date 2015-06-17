//
//  ViewController.m
//  Threelow
//
//  Created by Josh Endter on 6/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.game = [[Game alloc] init];
    [self refreshView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rollDice:(id)sender {
    
    [self.game rollDice];
    
    [self refreshView];
}

- (IBAction)resetDice:(id)sender {
    
    for (DieSlot *dieSlot in self.game.dieSlots) {
        dieSlot.isHeld = NO;
        dieSlot.isHoldableThisRound = YES;
        dieSlot.value = nil;
    }
    
    [self.game endGame];
    [self.game rollDice];
    
    [self refreshView];
}

- (IBAction)holdDie:(id)sender {

    NSInteger indexOfButton = [self.diceButtons indexOfObject:sender];
    DieSlot *dieSlotToChange = self.game.dieSlots[indexOfButton];
    
    if (dieSlotToChange.value && dieSlotToChange.isHoldableThisRound == YES) {
        // If the die slot is not nil (aka the game has not just started)
        // and the die was held this round
        if (dieSlotToChange.isHeld == YES) {
            [dieSlotToChange setIsHeld:NO];
        } else {
            [self.game.dieSlots[indexOfButton] setIsHeld:YES];
        }
    }
    
    
    
    [self refreshView];

}

- (void)refreshView {
    int score = 0;
    
    int numOfHeldDie = 0;
    int counter = 0;
    for (DieSlot *dieSlot in self.game.dieSlots) {
        
        // Add to the score
        if (dieSlot.isHeld) {
            if (!([dieSlot.value integerValue] == 3)) {
                score = score + [dieSlot.value intValue];
            }
        }
        
        // Add 1 to the numOfHeldDie
        // This helps determine if the game is over
        if (dieSlot.isHeld) {
            numOfHeldDie++;
        }
        
        // Get the button at the current dieSlot index
        UIButton *buttonToTest = (UIButton *)self.diceButtons[counter];
        
        // Change the colors of the button
        if (dieSlot.isHeld) {
            UIColor *heldColor =[UIColor colorWithRed:0 green:44.0/255.0 blue:132.0/255.0 alpha:1];
            buttonToTest.tintColor = heldColor;
        } else {
            UIColor *notHeldColor =[UIColor colorWithRed:87.0/255.0 green:192.0/255.0 blue:250.0/255.0 alpha:1];
            buttonToTest.tintColor = notHeldColor;
        }
        
        // Change the numbers on the on screen dice
        if ([dieSlot.value isEqual:@1]) {
            [buttonToTest setTitle:@"⚀" forState:UIControlStateNormal];
            //buttonToTest.titleLabel.text = @"⚀";
        } else if ([dieSlot.value isEqual:@2]) {
            [buttonToTest setTitle:@"⚁" forState:UIControlStateNormal];
            //buttonToTest.titleLabel.text = @"⚁";
        } else if ([dieSlot.value isEqual:@3]) {
            [buttonToTest setTitle:@"⚂" forState:UIControlStateNormal];
            //buttonToTest.titleLabel.text = @"⚂";
        } else if ([dieSlot.value isEqual:@4]) {
            [buttonToTest setTitle:@"⚃" forState:UIControlStateNormal];
            //buttonToTest.titleLabel.text = @"⚃";
        } else if ([dieSlot.value isEqual:@5]) {
            [buttonToTest setTitle:@"⚄" forState:UIControlStateNormal];
            //buttonToTest.titleLabel.text = @"⚄";
        } else if ([dieSlot.value isEqual:@6]) {
            [buttonToTest setTitle:@"⚅" forState:UIControlStateNormal];
            //buttonToTest.titleLabel.text = @"⚅";
        }
        
        counter++;
    }
    
    int numOfTotalDie = counter;
    if (numOfHeldDie == numOfTotalDie) {
        [self.game endGame];
        if (score < self.game.highScore) {
            self.game.highScore = score;
        }
    }
    
    // Update the score
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %d", score];
    self.highScoreLabel.text = [NSString stringWithFormat:@"best: %d", self.game.highScore];
    
}

@end
