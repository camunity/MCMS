//
//  GameViewController.m
//  MCMS
//
//  Created by Kyle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *battler1;
@property (strong, nonatomic) IBOutlet UIImageView *battler2;
@property (strong, nonatomic) IBOutlet UIImageView *battler3;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startBattle];

}

- (void)startBattle {

    NSSortDescriptor *sort;
    sort = [[NSSortDescriptor alloc]initWithKey:@"creatureXP" ascending:YES];
    NSArray *newArray = [NSArray arrayWithObject:sort];
    NSArray *newnewArray;
    newnewArray = [self.creatures sortedArrayUsingDescriptors:newArray];






    self.battler1.image = [[newnewArray objectAtIndex:0] creatureImage];
    self.battler2.image = [[newnewArray objectAtIndex:1] creatureImage];
    self.battler3.image = [[newnewArray objectAtIndex:2] creatureImage];




    CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [anim setToValue:[NSNumber numberWithFloat:0.0f]];
    [anim setFromValue:[NSNumber numberWithDouble:M_PI/16]]; // rotation angle
    [anim setDuration:0.05];
    [anim setRepeatCount:NSUIntegerMax];
    [anim setAutoreverses:YES];
    [self.battler1.layer addAnimation:anim forKey:@"iconShake"];

    CABasicAnimation* anim2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [anim2 setToValue:[NSNumber numberWithFloat:0.0f]];
    [anim2 setFromValue:[NSNumber numberWithDouble:M_PI/12]]; // rotation angle
    [anim2 setDuration:0.3];
    [anim2 setRepeatCount:NSUIntegerMax];
    [anim2 setAutoreverses:YES];
    [self.battler2.layer addAnimation:anim2 forKey:@"iconShake"];

    CABasicAnimation* anim3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [anim3 setToValue:[NSNumber numberWithFloat:0.0f]];
    [anim3 setFromValue:[NSNumber numberWithDouble:M_PI/12]]; // rotation angle
    [anim3 setDuration:0.1];
    [anim3 setRepeatCount:NSUIntegerMax];
    [anim3 setAutoreverses:YES];
    [self.battler3.layer addAnimation:anim3 forKey:@"iconShake"];


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


@end
