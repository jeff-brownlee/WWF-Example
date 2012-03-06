//
//  WWFTilePlay.m
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WWFTilePlay.h"

@implementation WWFTilePlay

@synthesize row = _row;
@synthesize column = _column;
@synthesize letter = _letter;

// initializes a play with provided letter (assumes A-Z upper case),
// row, and column values
- (id)initWithletter:(NSString*)letter
                   row:(int)row
                column:(int)column
{
    self = [super init];
    if(self)
    {
        //[self set
        [self setLetter:letter];
        [self setRow:row];
        [self setColumn:column];
    }
    return self;
}

// returns string representation of the tile play
- (NSString*)description
{
    return [NSString stringWithFormat:@"\tTilePlay: column=%d row=%d letter=%@",self.column,self.row,self.letter];
}

- (void)dealloc
{
    [_letter release];
    [super dealloc];
}
@end
