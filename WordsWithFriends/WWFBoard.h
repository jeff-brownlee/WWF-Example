//
//  WWFBoard.h
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WWFMove;
@class WWFSquare;

/**
 Represents the current state of the board,
 Maintains list of all valid moves,
 Maintains current score for each player
 */
@interface WWFBoard : NSObject
{
    NSArray *_squares;
    NSMutableArray *_moves;
    int _player1Score;
    int _player2Score;
}
- (BOOL)addMove:(WWFMove *)move;

- (WWFSquare*)squareWithRow:(int)row
                     column:(int)column;

@property (nonatomic, retain) NSArray *squares;
@property (nonatomic) int player1Score;
@property (nonatomic) int player2Score;

@end
