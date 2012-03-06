//
//  WWFSquare.h
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 Represents an individual position on the board
 along with any associated square multipliers.
 When a square has been played as part of a valid
 move, the square is considered closed.  This deactivates
 the multipliers for scoring.
 */
@interface WWFSquare : NSObject
{
    NSString *_letter;
    int _letterMultiplier;
    int _wordMultiplier;
    BOOL _closed;
}
@property (nonatomic) int letterMultiplier;
@property (nonatomic) int wordMultiplier;
@property (nonatomic,copy) NSString* letter;
@property (nonatomic, assign) BOOL closed;

- (id)initWithDoubleLetter;
- (id)initWithTripleLetter;
- (id)initWithDoubleWord;
- (id)initWithTripleWord;
- (BOOL)isOpen;
- (BOOL)isClosed;
- (int)points;
- (int)wordMultiplierValue;

@end
