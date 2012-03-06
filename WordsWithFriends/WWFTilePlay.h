//
//  WWFTilePlay.h
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Represents a tile to be played as part of a move.
 Includes the letter, and row,column where the
 tiles is to be played.
 */
@interface WWFTilePlay : NSObject
{
    int _row;
    int _column;
    NSString *_letter;
}
- (id)initWithletter:(NSString*)letter
                 row:(int)row
              column:(int)column;

@property (nonatomic) int row;
@property (nonatomic) int column;
@property (nonatomic, copy) NSString *letter;

@end
