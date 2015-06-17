//
//  ViewController.h
//  Threelow
//
//  Created by Josh Endter on 6/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Game.h"

@interface ViewController : UIViewController

//@property (nonatomic, strong) NSMutableArray *heldDice;

@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *diceButtons;
@property (nonatomic, strong) Game *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;



- (void)refreshView;

@end

