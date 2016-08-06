//
//  Jokers.h
//  iHangmanClassic
//
//  Created by Patricia T. on 3/13/13.
//  Copyright (c) 2013 tinokio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Jokers : NSObject
{
    int _count;
}

@property (nonatomic) int Count;

-(BOOL)Remove:(int)quantity;
-(BOOL)Add:(int)quantity;
-(void)LoadCount;
-(void)SaveCount;

@end
