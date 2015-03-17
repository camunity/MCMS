//
//  MagicalCreature.m
//  MCMS
//
//  Created by Cameron Flowers on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name WithDetail:(NSString *)detail{
   self = [super self];
    if(self){
        self.name = name;
        self.detail = detail;
    }
    return self;
}

@end
