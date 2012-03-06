//
//  WWFWord.m
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WWFWord.h"

@implementation WWFWord
@synthesize word = _word;
@synthesize points = _points;

// initializes a word with the provided word
// and points
- (id)initWithWord:(NSString*)word
                 points:(int)points
{
    self = [super init];
    if(self)
    {
        [self setPoints:points];
        [self setWord:word];
    }
    return self;
}

// returns string representation of the tile play
- (NSString*)description
{
    return [NSString stringWithFormat:@"\tWord: word=%@ points=%d",[self word],[self points]];
}

-(void)dealloc
{
    [_word release];
    [super dealloc];
}

@end
