//
//  WWFTestGame1.m
//  WordsWithFriends
//
//  Created by Jeff Brownlee on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WWFTestGame1.h"
#import "WWFBoard.h"
#import "WWFSquare.h"
#import "WWFMove.h"
#import "WWFTilePlay.h"

@implementation WWFTestGame1

+ (void)perform
{
    // create board
    WWFBoard* board = [[WWFBoard alloc] init];       
    NSLog(@"Created board");
    NSLog(@"%@",[board description]);
    
    WWFMove *playerOneMove;
    WWFMove *playerTwoMove;
        
    
    // PLAYER1: attempt initial move that doesn't contain center square
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"N" row:7 column:8] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:7 column:9] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"A" row:7 column:10] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"T" row:7 column:11] autorelease]];        
    NSLog(@"%@: Attempted initial move without a center square play.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt initial move that contains a center square
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"N" row:7 column:7] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:7 column:8] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"A" row:7 column:9] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"T" row:7 column:10] autorelease]];
    NSLog(@"%@: Attempted initial move with a center square play.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt move that is not all in the same column
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"F" row:4 column:9] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:5 column:10] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:6 column:10] autorelease]];
    NSLog(@"%@: Attempted move with plays not all in the same column.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);        
    
    // PLAYER2: attempt move that is not contiguous
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"F" row:3 column:10] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:5 column:10] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:6 column:10] autorelease]];
    NSLog(@"%@: Attempted move that does not form contiguous word.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt move that is not contiguous
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"F" row:4 column:10] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:5 column:10] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:8 column:10] autorelease]];
    NSLog(@"%@: Attempted move that does not form contiguous word.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt move that places tiles in non-available square
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"F" row:5 column:10] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:6 column:10] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:7 column:10] autorelease]];
    NSLog(@"%@: Attempted move that includes a move in a square that has already been played.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid row move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"F" row:4 column:10] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:5 column:10] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:6 column:10] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid column move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"Q" row:3 column:7] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"U" row:4 column:7] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:5 column:7] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:6 column:7] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid row move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"I" row:4 column:11] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"N" row:4 column:13] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:4 column:12] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"D" row:4 column:14] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid column move that picks up an adjacent word
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"H" row:3 column:11] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"N" row:5 column:11] autorelease]];
    NSLog(@"%@: Attempted valid column move that includes an adjacent word.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"N" row:2 column:14] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:3 column:14] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:5 column:14] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid row move with a triple letter
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"T" row:5 column:3] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"R" row:5 column:4] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"I" row:5 column:5] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"B" row:5 column:6] autorelease]];
    NSLog(@"%@: Attempted valid row move with a TL.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid row move with adjacent word
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"D" row:6 column:11] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:6 column:12] autorelease]];
    NSLog(@"%@: Attempted valid row move with adjacent word.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid column move with a triple letter
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"J" row:3 column:3] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"U" row:4 column:3] autorelease]];
    NSLog(@"%@: Attempted valid row move with a TL.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move with adjacent word
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"R" row:6 column:9] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"T" row:8 column:9] autorelease]];
    NSLog(@"%@: Attempted valid column move with adjacent word.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid column move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"S" row:8 column:7] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move with adjacent word
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"A" row:8 column:8] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"R" row:9 column:8] autorelease]];
    NSLog(@"%@: Attempted valid column move with adjacent word.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid row move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:9 column:9] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"A" row:9 column:10] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"M" row:9 column:11] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"S" row:9 column:12] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"A" row:10 column:12] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"L" row:11 column:12] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"A" row:12 column:12] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"D" row:13 column:12] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid column move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:6 column:4] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:7 column:4] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"F" row:8 column:4] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid single letter move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"I" row:3 column:8] autorelease]];
    NSLog(@"%@: Attempted valid single letter move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid row move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"W" row:11 column:10] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:11 column:11] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"T" row:11 column:13] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid row move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"G" row:7 column:2] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"L" row:7 column:3] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"B" row:7 column:5] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid column move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"I" row:12 column:10] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"N" row:13 column:10] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"D" row:14 column:10] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"T" row:9 column:4] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:10 column:4] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"P" row:11 column:4] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"S" row:12 column:4] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid row move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"D" row:10 column:3] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"G" row:10 column:5] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid row move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"W" row:14 column:8] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:14 column:9] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"S" row:14 column:11] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid row move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"H" row:12 column:0] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:12 column:1] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"L" row:12 column:2] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:12 column:3] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"N" row:11 column:1] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"O" row:13 column:1] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"K" row:14 column:1] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid row move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"A" row:3 column:4] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"M" row:3 column:5] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid row move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:14 column:2] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"G" row:14 column:3] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid single letter move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"A" row:1 column:14] autorelease]];
    NSLog(@"%@: Attempted valid single letter move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"R" row:1 column:5] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"U" row:2 column:5] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid single letter move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"Y" row:10 column:6] autorelease]];
    NSLog(@"%@: Attempted valid single letter move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:11 column:6] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"T" row:12 column:6] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid row move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"H" row:1 column:2] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"A" row:1 column:3] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"I" row:1 column:4] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid row move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"I" row:13 column:13] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"P" row:13 column:14] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid row move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"U" row:12 column:7] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"T" row:12 column:8] autorelease]];
    NSLog(@"%@: Attempted valid row move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"C" row:1 column:1] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"R" row:2 column:1] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"A" row:3 column:1] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"Z" row:4 column:1] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"Y" row:5 column:1] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid column move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"S" row:11 column:14] autorelease]];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"I" row:12 column:14] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"H" row:11 column:7] autorelease]];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"E" row:13 column:7] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid single letter move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"X" row:7 column:12] autorelease]];
    NSLog(@"%@: Attempted valid single letter move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER2: attempt valid column move
    playerTwoMove = [[[WWFMove alloc] initWithPlayerID:2] autorelease];
    [playerTwoMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"I" row:13 column:2] autorelease]];
    NSLog(@"%@: Attempted valid column move.",[board addMove:playerTwoMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid single letter move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"L" row:3 column:0] autorelease]];
    NSLog(@"%@: Attempted valid single letter move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
    
    // PLAYER1: attempt valid single letter move
    playerOneMove = [[[WWFMove alloc] initWithPlayerID:1] autorelease];
    [playerOneMove addTilePlay:[[[WWFTilePlay alloc] initWithletter:@"T" row:0 column:3] autorelease]];
    NSLog(@"%@: Attempted valid single letter move.",[board addMove:playerOneMove] ? @"PASS": @"FAIL");
    NSLog(@"%@",[board description]);
}

@end
