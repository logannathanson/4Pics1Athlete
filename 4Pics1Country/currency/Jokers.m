//
//  Jokers.m
//  iHangmanClassic
//
//  Created by Patricia T. on 3/13/13.
//  Copyright (c) 2013 tinokio. All rights reserved.
//

#import "Jokers.h"

@implementation Jokers
@synthesize Count = _count;

-(BOOL)Remove:(int)quantity
{
    if (quantity > self.Count)
    {
        return false;
    }
    
    self.Count -= quantity;
    [self SaveCount];
    
    return true;
}

-(BOOL)Add:(int)quantity
{
    self.Count += quantity;
    [self SaveCount];
    
    return true;
}

-(void)LoadCount
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL userAlreadyPlayedThisGame = [defaults boolForKey:@"userAlreadyPlayedThisGame"];
    
    if(!userAlreadyPlayedThisGame)
    {
        self.Count = 70;
        [defaults setBool:true forKey:@"userAlreadyPlayedThisGame"];
        [self SaveCount];
    }
    
   self.Count = [defaults integerForKey:@"jokers"];
}
-(void)SaveCount
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.Count forKey:@"jokers"];
}

@end
