//
//  MagicalCreature.h
//  MCMS
//
//  Created by Cameron Flowers on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *detail;
@property UIImage *creatureImage;
@property NSMutableArray *accessories;
@property NSInteger creatureXP;

-(instancetype)initWithName:(NSString *)name WithDetail:(NSString *)detail;

@end
