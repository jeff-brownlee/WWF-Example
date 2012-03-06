//
//  WWFMove.h
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WWFTilePlay;
/**
 Contains a collection of tile plays.
 */
@interface WWFMove : NSObject
{
    int _playerID;
    NSMutableArray *_tilePlays;
    int _minColumn;
    int _maxColumn;
    int _minRow;
    int _maxRow;
    int _points;
}

- (id)initWithPlayerID:(int)playerID;
- (void)addTilePlay:(WWFTilePlay*)tilePlay;
- (BOOL)isColumnMove;
- (BOOL)isRowMove;
- (BOOL)containsCenter;

@property (nonatomic) int playerID;
@property (nonatomic) int minColumn;
@property (nonatomic) int maxColumn;
@property (nonatomic) int minRow;
@property (nonatomic) int maxRow;
@property (nonatomic) int points;
@property (readonly) NSMutableArray* tilePlays;

@end
