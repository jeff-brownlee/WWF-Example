//
//  WWFSquare.m
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WWFSquare.h"

static NSDictionary *letterValues;

@implementation WWFSquare

@synthesize letter = _letter;
@synthesize wordMultiplier = _wordMultiplier;
@synthesize letterMultiplier = _letterMultiplier;
@synthesize closed = _closed;

// returns static dictionary with letters as keys
// and assigned values as value
// it is assumed that all letters are represented with upper case characters
+ (NSDictionary*)letterValues
{
    // doesn't allow for blank tiles to be played
    if(!letterValues)
    {
        letterValues = [[NSDictionary alloc] initWithObjectsAndKeys:
            [NSNumber numberWithInt:1], @"A", [NSNumber numberWithInt:4], @"B",
            [NSNumber numberWithInt:4], @"C", [NSNumber numberWithInt:2], @"D",
            [NSNumber numberWithInt:1], @"E", [NSNumber numberWithInt:4], @"F",
            [NSNumber numberWithInt:3], @"G", [NSNumber numberWithInt:3], @"H",
            [NSNumber numberWithInt:1], @"I", [NSNumber numberWithInt:10], @"J",
            [NSNumber numberWithInt:5], @"K", [NSNumber numberWithInt:2], @"L",
            [NSNumber numberWithInt:4], @"M", [NSNumber numberWithInt:2], @"N",
            [NSNumber numberWithInt:1], @"O", [NSNumber numberWithInt:4], @"P",
            [NSNumber numberWithInt:10], @"Q", [NSNumber numberWithInt:1], @"R",
            [NSNumber numberWithInt:1], @"S", [NSNumber numberWithInt:1], @"T",
            [NSNumber numberWithInt:2], @"U", [NSNumber numberWithInt:5], @"V",
            [NSNumber numberWithInt:4], @"W", [NSNumber numberWithInt:8], @"X",
            [NSNumber numberWithInt:3], @"Y", [NSNumber numberWithInt:10], @"Z", nil];
    }
    return letterValues;
}

// initializes the square with the provided letter and word multipliers
- (id)initWithLetterMultiplier:(int)letterMultiplier
                wordMultiplier:(int)wordMultiplier
{
    self = [super init];
    if (self) 
    {        
        [self setLetterMultiplier:letterMultiplier];
        [self setWordMultiplier:wordMultiplier];
        [self setClosed:NO];
    }
    return self;    
}

- (id)initWithDoubleLetter
{
    return [self initWithLetterMultiplier:2 wordMultiplier:1];
}

- (id)initWithTripleLetter
{
    return [self initWithLetterMultiplier:3 wordMultiplier:1];
}

- (id)initWithDoubleWord
{
    return [self initWithLetterMultiplier:1 wordMultiplier:2];    
}

- (id)initWithTripleWord
{
    return [self initWithLetterMultiplier:1 wordMultiplier:3];    
}

- (id)init
{
    return [self initWithLetterMultiplier:1 wordMultiplier:1];        
}

// indicates that a letter can be played in the square
- (BOOL)isOpen
{
    return ([self letter] == nil);    
}

// indicates that the square has been played in a previously completed move
- (BOOL)isClosed
{
    return ([self closed]);    
}

// returns the number of points for the square
// based on the assigned letter and letter multiplier
- (int)points
{
    int value = [[[WWFSquare letterValues] objectForKey:[self letter]] intValue];
    return [self isClosed] ? value : value * [self letterMultiplier];
}

// returns 1 if square is closed
// otherwise returns value of wordMultiplier
- (int)wordMultiplierValue
{
    return [self isClosed] ? 1 : [self wordMultiplier];
}

// returns string representation of the square
- (NSString *)description
{
    NSString *desc;
    if(self.letter)
    {
        desc = [NSString stringWithFormat:@"  %@ ",self.letter];
    }
    else if (self.wordMultiplier == 1 && self.letterMultiplier == 1) 
    {
        desc = @" __ ";
    }
    else if(self.wordMultiplier == 2)
    {
        desc = @" DW ";
    }
    else if(self.wordMultiplier == 3)
    {
        desc = @" TW ";
    }
    else if(self.letterMultiplier == 2)
    {
        desc = @" DL ";
    }
    else if(self.letterMultiplier == 3)
    {
        desc = @" TL ";
    }
    return desc;
}

- (void)dealloc
{
    [_letter release];
    [super dealloc];
}

@end
