//
//  WWFBoard.m
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WWFBoard.h"
#import "WWFSquare.h"
#import "WWFMove.h"
#import "WWFTilePlay.h"
#import "WWFWord.h"

@implementation WWFBoard
@synthesize squares = _squares;
@synthesize player1Score = _player1Score;
@synthesize player2Score = _player2Score;

// initializes board with appropriate squares
// and initialzes scores and moves array
-(id)init
{
    self = [super init];
    if (self) 
    {
        // initialize board with 15x15 empty squares with appropriate multipliers
        NSMutableArray *squaresTable = [[NSMutableArray alloc] init];
        
        NSArray *row;
        // row 0
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];

        // row 1
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];       
        
        // row 2
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 3
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] initWithTripleWord] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleWord] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 4
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 5
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 6
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] initWithTripleLetter] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 7
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 8
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] initWithTripleLetter] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 9
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 10
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 11
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] initWithTripleWord] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleWord] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 12
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];
        
        // row 13
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithDoubleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];  
        
        // row 14
        row = [NSArray arrayWithObjects:
               [[[WWFSquare alloc] init] autorelease], 
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleLetter] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] initWithTripleWord] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               [[[WWFSquare alloc] init] autorelease],
               nil];
        [squaresTable addObject:row];
        [self setSquares:[NSArray arrayWithArray:squaresTable]];
        [squaresTable release];
        
        // create moves array
        _moves = [[NSMutableArray alloc] init];
        
        // initialize scores
        [self setPlayer1Score:0];
        [self setPlayer1Score:0];
    }
    return self;
}

// returns string representation of board
-(NSString *)description
{
    NSString *desc = @"Board:\n";
    for (id row in [self squares]) 
    {
        for (id square in row)
        {
            desc = [desc stringByAppendingString:[square description]];
        }
        desc = [desc stringByAppendingString:@"\n"];
    }
    desc = [desc stringByAppendingString:[NSString stringWithFormat:@"Player 1: %d\n",[self player1Score]]];
    desc = [desc stringByAppendingString:[NSString stringWithFormat:@"Player 2: %d\n",[self player2Score]]];
    return desc;
}

// retrieves square for row and column
- (WWFSquare*)squareWithRow:(int)row
                     column:(int)column
{
    return [[[self squares] objectAtIndex:row] objectAtIndex:column];
}

// check that the squares are open for all plays in move
- (BOOL)areSquaresOpen:(WWFMove*)move
{
    BOOL open = YES;
    WWFSquare *square;
    for (WWFTilePlay* play in [move tilePlays]) 
    {
        square = [self squareWithRow:[play row] column:[play column]];
        if(![square isOpen])
        {
            open = NO;
            break;
        }
    }
    return open;  
}

// fill squares with plays in moves
- (BOOL)fillSquares:(WWFMove*)move
{
    BOOL squaresFilled = NO;
    if([self areSquaresOpen:move])
    {
        squaresFilled = YES;
        WWFSquare *square;
        for (WWFTilePlay* play in [move tilePlays]) 
        {
            square = [self squareWithRow:[play row] column:[play column]];
            [square setLetter:[play letter]];
        }         
    }
    return squaresFilled;
}

// check that move + pre-existing moves makes a continuous word
- (BOOL)isContinuousWord:(WWFMove*)move
{
    BOOL continuous = YES;
    int column;
    int row;
    WWFSquare* square;
    if([move isColumnMove])
    {
        //iterate over squares in column
        column = [move minColumn];
        for (row=[move minRow]; row <= [move maxRow]; row++) 
        {
            square = [self squareWithRow:row column:column];
            if([square isOpen])
            {
                continuous = NO;
                break;
            }
        }
    }
    else
    {
        //iterate over squares in row
        row = [move minRow];
        for (column=[move minColumn]; column <= [move maxColumn]; column++) 
        {
            square = [self squareWithRow:row column:column];
            if([square isOpen])
            {
                continuous = NO;
                break;
            }
        }
    }
    return continuous;
}

// check that tile placement is valid
- (BOOL)isTilePlacementValid:(WWFMove*)move
{
    BOOL valid = NO;

    // if first move, make sure that it includes center: row=7, column=7
    if([_moves count] > 0 || ([_moves count] == 0 && [move containsCenter]))
    {
        // check that the plays are in the same column or same row
        if([move isColumnMove] || [move isRowMove])
        {            
            // check for continous word
            valid = [self isContinuousWord:move];
        }
    }
    return valid;
}

// finds min row that makes a continuous word
-(int)growWordUpFromRow:(int)row
                 column:(int)column
{
    // grow word up until we find an open square
    BOOL growing = YES;
    while(growing && row >= 1)
    {
        if(![[self squareWithRow:row-1 column:column] isOpen])
        {
            // square contains letter
            row--;
        }
        else
        {
            growing = NO;
        }
    }
    return row;
}

// finds max row that makes a continuous word
-(int)growWordDownFromRow:(int)row
                 column:(int)column
{
    // grow word up until we find an open square
    BOOL growing = YES;
    while(growing && row <= 13)
    {
        if(![[self squareWithRow:row+1 column:column] isOpen])
        {
            // square contains letter
            row++;
        }
        else
        {
            growing = NO;
        }
    }
    return row;
}

// gets biggest word that can be made on the board
// based on a starting row and ending row
- (WWFWord*)getColumnWordForColumn:(int)column
                      startRow:(int)startRow
                        endRow:(int)endRow
{
    // grow word to include any preexisting squares
    startRow = [self growWordUpFromRow:startRow column:column];
    endRow = [self growWordDownFromRow:endRow column:column];
 
    NSString *word = @"";
    int points = 0;
    int wordMultiplier = 1;
    WWFSquare *square;
    
    // iterate over new word to build word and accumulate points
    for(int row = startRow; row <= endRow; row++)
    {
        square = [self squareWithRow:row column:column];
        word = [word stringByAppendingString:[square letter]];
        points = points + [square points];
        wordMultiplier = wordMultiplier * [square wordMultiplierValue];        
    }
    points = points * wordMultiplier;
    WWFWord *candidateWord = nil;
    if([word length] > 1)
    {
        candidateWord = [[WWFWord alloc] initWithWord:word points:points]; 
    }
    return candidateWord;
}

// finds min column that makes a continuous word
-(int)growWordLeftFromRow:(int)row
                   column:(int)column
{
    // grow word up until we find an open square
    BOOL growing = YES;
    while(growing && column >= 1)
    {
        if(![[self squareWithRow:row column:column-1] isOpen])
        {
            // square contains letter
            column--;
        }
        else
        {
            growing = NO;
        }
    }
    return column;
}

// finds max column that makes a continuous word
-(int)growWordRightFromRow:(int)row
                   column:(int)column
{
    // grow word up until we find an open square
    BOOL growing = YES;
    while(growing && column <= 13)
    {
        if(![[self squareWithRow:row column:column+1] isOpen])
        {
            // square contains letter
            column++;
        }
        else
        {
            growing = NO;
        }
    }
    return column;
}

// gets biggest word that can be made on the board
// based on a starting column and ending column
- (WWFWord*)getRowWordForRow:(int)row
                 startColumn:(int)startColumn
                   endColumn:(int)endColumn
{
    // grow word to include any preexisting squares
    startColumn = [self growWordLeftFromRow:row column:startColumn];
    endColumn = [self growWordRightFromRow:row column:endColumn];
    
    NSString *word = @"";
    int points = 0;
    int wordMultiplier = 1;
    WWFSquare *square;
    
    // iterate over new word to build word and accumulate points
    for(int column = startColumn; column <= endColumn; column++)
    {
        square = [self squareWithRow:row column:column];
        word = [word stringByAppendingString:[square letter]];
        points = points + [square points];
        wordMultiplier = wordMultiplier * [square wordMultiplierValue];        
    }
    points = points * wordMultiplier;
    WWFWord *candidateWord = nil;
    if([word length] > 1)
    {
        candidateWord = [[WWFWord alloc] initWithWord:word points:points]; 
    }
    return candidateWord;
}

// finds all the words that have been created based on provided move
- (NSArray*)getWordsForMove:(WWFMove*)move
{
    NSMutableArray *words = [[[NSMutableArray alloc] init] autorelease];
    WWFWord *candidateWord;
    if([move isColumnMove])
    {
        //get main word
        candidateWord = [self getColumnWordForColumn:[move minColumn] startRow:[move minRow] endRow:[move maxRow]];
        if (candidateWord) 
        {
            [words addObject:candidateWord];
        }
        
        //get adjacent words by iterating over squares in move and finding horizontal words
        for (WWFTilePlay* play in [move tilePlays]) 
        {
            candidateWord = [self getRowWordForRow:[play row] startColumn:[play column] endColumn:[play column]];
            if (candidateWord) 
            {
                [words addObject:candidateWord];
            }
        }
    }
    else
    {
        //get main word
        candidateWord = [self getRowWordForRow:[move minRow] startColumn:[move minColumn] endColumn:[move maxColumn]];
        if (candidateWord) 
        {
            [words addObject:candidateWord];
        }
        
        //get adjacent words by iterating over squares in move and finding column words
        for (WWFTilePlay* play in [move tilePlays]) 
        {
            candidateWord = [self getColumnWordForColumn:[play column] startRow:[play row] endRow:[play row]];
            if (candidateWord) 
            {
                [words addObject:candidateWord];
            }
        }        
    }
    return words;
}

// assumes all words are valid
+ (BOOL)isValidWord:(NSString*)word
{
    return YES;
}

// calculates the point total for list of words
// returns 0 points if it finds an invalid word
+ (int)calculatePointsForWords:(NSArray*)words
{
    int points = 0;
    for (WWFWord* candidateWord in words) 
    {
        if ([WWFBoard isValidWord:[candidateWord word]]) 
        {
            points = points + [candidateWord points];
        }
        else
        {
            points = 0;
            break;
        }
    }
    return points;
}

// closes the move by setting the close status of each square included in the move
// and updating the scores on the board
- (void)closeMove:(WWFMove*)move
{
    //update square for each play
    WWFSquare *square;
    for (WWFTilePlay* play in [move tilePlays]) 
    {
        square = [self squareWithRow:[play row] column:[play column]];
        [square setClosed:YES];
    }  
    
    if([move playerID]==1)
    {
        //update player 1 score
        [self setPlayer1Score:([self player1Score] + [move points])];
    }
    else
    {
        //update player 2 score
        [self setPlayer2Score:([self player2Score] + [move points])];
    }
    // add move to list of completed moves
    [_moves addObject:move];
}

// remove letters from each square included in the move
-(void)removeMove:(WWFMove *)move
{
    //update square for each play
    WWFSquare *square;
    for (WWFTilePlay* play in [move tilePlays]) 
    {
        square = [self squareWithRow:[play row] column:[play column]];
        [square setLetter:nil];
    }    
}

// add move validates and scores the move
// if the move is not valid the board will revert to previous state
// if valid the board will include the newly played letters
// and the score will be updated
- (BOOL)addMove:(WWFMove *)move
{
    //assumes moves are being made in proper order
    //and by valid players
    BOOL validMove = NO;
    NSLog(@"Attempting Move: %@",[move description]);
    
    // attempt to fill squares
    BOOL squaresFilled = [self fillSquares:move];

    // validate move
    if(squaresFilled && [self isTilePlacementValid:move])
    {
        // placement is valid
        
        // get words for move
        NSArray *words = [[self getWordsForMove:(WWFMove *)move] retain];
        
        // calculate points for move
        [move setPoints:[WWFBoard calculatePointsForWords:words]]; 
        [words release];
    }
    
    if ([move points] > 0) 
    {
        // valid move
        [self closeMove:move];
        validMove = YES;
    }
    else if(squaresFilled)
    {
        // invalid move
        [self removeMove:move];
    }
    return validMove;
}

- (void)dealloc
{
    [_moves release];
    [_squares release];
    [super dealloc];
}

@end
