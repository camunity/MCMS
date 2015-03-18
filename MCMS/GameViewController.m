//
//  GameViewController.m
//  MCMS
//
//  Created by Kyle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "GameViewController.h"
#import "MagicalCreature.h"

@interface GameViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *battler1;
@property (strong, nonatomic) IBOutlet UIImageView *battler2;
@property (strong, nonatomic) IBOutlet UIImageView *battler3;
@property NSTimer *timer;
@property int timerInt;
@property MagicalCreature *winningCreature;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startBattle];

    self.timerInt = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(countDown)
                                                userInfo:nil
                                                 repeats:YES];







}

- (void)countDown {

    if (self.timerInt++ == 3) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Battle Over"
                                                        message:[NSString stringWithFormat:@"The Winner is %@ with %li points", self.winningCreature.name,
                                                                 self.winningCreature.creatureXP]
                                                       delegate:self
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil];
        [alert show];
        [self.timer invalidate];
    }


}

- (void)startBattle {

    NSSortDescriptor *sort;
    sort = [[NSSortDescriptor alloc]initWithKey:@"creatureXP" ascending:NO];
    NSArray *newArray = [NSArray arrayWithObject:sort];
    NSArray *newnewArray;
    newnewArray = [self.creatures sortedArrayUsingDescriptors:newArray];

    self.winningCreature = [newnewArray objectAtIndex:0];

    self.battler1.image = [[newnewArray objectAtIndex:0] creatureImage];
    self.battler2.image = [[newnewArray objectAtIndex:1] creatureImage];
    self.battler3.image = [[newnewArray objectAtIndex:2] creatureImage];

    [self animateBattlers:self.battler1 withRotation:16 duration:0.05];
    [self animateBattlers:self.battler2 withRotation:12 duration:0.3];
    [self animateBattlers:self.battler3 withRotation:12 duration:0.1];


    [UIView animateWithDuration:0.5f animations:^{
        CGRect currentRect=self.battler2.frame;
        currentRect.origin.y-=130;
        [self.battler2 setFrame:currentRect];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5f animations:^{
            CGRect currentRect=self.battler2.frame;
            currentRect.origin.y+=130;
            [self.battler2 setFrame:currentRect];
        }];
    }];


}

- (void)animateBattlers:(UIImageView *)battler withRotation:(int)rotation duration:(CFTimeInterval)interval {
    CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [anim setToValue:[NSNumber numberWithFloat:0.0f]];
    [anim setFromValue:[NSNumber numberWithDouble:M_PI/rotation]]; // rotation angle
    [anim setDuration:interval];
    [anim setRepeatCount:NSUIntegerMax];
    [anim setAutoreverses:YES];
    [battler.layer addAnimation:anim forKey:@"iconShake"];
}



- (void)viewWillDisappear:(BOOL)animated {
    [self.timer invalidate];
}




@end
