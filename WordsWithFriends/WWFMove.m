//
//  WWFMove.m
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WWFMove.h"
#import "WWFTilePlay.h"

@implementation WWFMove
@synthesize playerID = _playerID;
@synthesize tilePlays = _tilePlays;
@synthesize minColumn = _minColumn;
@synthesize maxColumn = _maxColumn;
@synthesize minRow = _minRow;
@synthesize maxRow = _maxRow;
@synthesize points = _points;

// initializes move with a player id
// and sets default values for board indexes
// and points
- (id)initWithPlayerID:(int)playerID
{
    self = [super init];
    if(self)
    {
        [self setPlayerID:playerID];
        _tilePlays = [[NSMutableArray alloc] init];
        [self setMinRow:15];
        [self setMinColumn:15];
        [self setMaxRow:-1];
        [self setMaxColumn:-1];
        [self setPoints:0];
    }
    return self;
}

// adds a tileplay to the move
- (void)addTilePlay:(WWFTilePlay *)tilePlay
{
    [_tilePlays addObject:tilePlay];
    // update indexes
    [self setMinRow:[tilePlay row] < self.minRow ? [tilePlay row] : self.minRow];
    [self setMinColumn:[tilePlay column] < self.minColumn ? [tilePlay column] : self.minColumn];
    [self setMaxRow:[tilePlay row] > self.maxRow ? [tilePlay row] : self.maxRow];
    [self setMaxColumn: [tilePlay column] > self.maxColumn ? [tilePlay column] : self.maxColumn];
}

// returns yes if all of the current tile plays
// in the same column
- (BOOL)isColumnMove
{
    return [self minColumn] == [self maxColumn];
}

// returns yes if all of the current tile plays
// in the same row
- (BOOL)isRowMove
{
    return [self minRow] == [self maxRow];
}

// returns yes if one of the current tile plays
// is in the center of the board
- (BOOL)containsCenter
{
    BOOL center = NO;
    // consider using block
    for (WWFTilePlay* play in _tilePlays) 
    {
        if([play column] == 7 && [play row] == 7)
        {
            center = YES;
            break;
        }
    }
    return center;
}

// sets the points for a move
// if move included 7 tile plays then add a bonus 35 points
- (void)setPoints:(int)points
{
    if(points > 0 && ([[self tilePlays] count] == 7))
    {
        _points =  points + 35;
    }
    else
    {
        _points = points;
    }
}

// returns string representation of the move
- (NSString*)description
{
    NSString *desc = @"\nMove:\n";
    desc = [desc stringByAppendingString:[NSString stringWithFormat:@"\tPlayer = %d\n",self.playerID]];
    for (id play in _tilePlays) 
    {
        desc = [desc stringByAppendingString:[NSString stringWithFormat:@"%@\n",[play description]]];
    }
    return desc;   
}

- (void)dealloc
{
    [_tilePlays release];
    [super dealloc];
}

@end
