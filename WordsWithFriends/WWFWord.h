//
//  WWFWord.h
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 Represents a word that has been formed on the board
 along with the points value for the word.
 */
@interface WWFWord : NSObject
{
    NSString *_word;    
    int _points;
}
- (id)initWithWord:(NSString*)word
            points:(int)points;

@property (nonatomic,copy) NSString* word;
@property (nonatomic) int points;

@end
