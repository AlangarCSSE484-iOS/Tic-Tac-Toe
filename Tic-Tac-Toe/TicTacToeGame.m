//
//  TicTacToeGame.m
//  Tic-Tac-Toe
//
//  Created by CSSE Department on 3/27/18.
//  Copyright © 2018 Rose-Hulman. All rights reserved.
//

#import "TicTacToeGame.h"

@implementation TicTacToeGame

-(id) init {
    self = [super init];
    if (self) {
        self.gameState = GameStateXTurn;
        for (int i = 0; i < 9; ++i) {
            gameBoard[i] = MarkTypeNone;
        }
    }
    return self;
}

-(void) pressedSquare:(NSInteger) index{
    NSLog(@"Pressed %d", (int)index);
    if (gameBoard[index] != MarkTypeNone) {
        return;
    }
    if (self.gameState == GameStateXTurn) {
        gameBoard[index] = MarkTypeX;
        self.gameState = GameStateoTurn;
        [self checkForGameOver];
    } else if (self.gameState == GameStateoTurn) {
        gameBoard[index] = MarkTypeO;
        self.gameState = GameStateXTurn;
        [self checkForGameOver];
    }
}

-(void) checkForGameOver {
    if (![[self getGameString] containsString:@"-"]){
        self.gameState = GameStateTie;
    }
    
    NSMutableArray* linesOf3 = [[NSMutableArray alloc] initWithCapacity:8];
    
    [linesOf3 addObject:[self getStringForLocation1:0 location2:1 location3:2]];
    [linesOf3 addObject:[self getStringForLocation1:3 location2:4 location3:5]];
    [linesOf3 addObject:[self getStringForLocation1:6 location2:7 location3:8]];
    
    [linesOf3 addObject:[self getStringForLocation1:0 location2:3 location3:6]];
    [linesOf3 addObject:[self getStringForLocation1:1 location2:4 location3:7]];
    [linesOf3 addObject:[self getStringForLocation1:2 location2:5 location3:8]];
    
    [linesOf3 addObject:[self getStringForLocation1:0 location2:4 location3:8]];
    [linesOf3 addObject:[self getStringForLocation1:2 location2:4 location3:6]];
    
    for (NSString* lineOf3 in linesOf3){
        if ([lineOf3 isEqualToString:@"XXX"]){
            self.gameState = GameStateXWon;
        } else if ([lineOf3 isEqualToString:@"OOO"]) {
            self.gameState = GameStateOWin;
        }
    }
    
}

-(NSString*) getGameStateString{
    switch(self.gameState) {
        case GameStateXTurn:
            return @"X's Turn";
        case GameStateoTurn:
            return @"O's Turn";
        case GameStateXWon:
            return @"X Won!";
        case GameStateOWin:
            return @"O Won!";
        case GameStateTie:
            return @"Tie Game!";
        default:
            break;
    }
}

//-(NSString*) getGameBoardString {
//    NSMutableString* gameBoardString = [[NSMutableString alloc] init];
//    for (int i = 0; i < 9; ++i){
//        [gameBoardString appendString:[self getMarkTypeString: gameBoard[i]]];
//    }
//    return gameBoardString;
//}

-(NSString*) getMarkTypeString: (MarkType) markType {
    switch(markType) {
        case MarkTypeNone:
            return @"-";
        case MarkTypeX:
            return @"X";
        case MarkTypeO:
            return @"O";
    }
}

- (NSString*) getGameString {
    NSMutableString* gameBoardString = [[NSMutableString alloc] init];
    for (int i = 0; i < 9; ++i){
        [gameBoardString appendString:[self getMarkTypeString: gameBoard[i]]];
    }
    return gameBoardString;
    
}

- (NSString*) getStringForLocation1:(int) index1 location2: (int) index2 location3:(int) index3 {
    NSMutableString* gameBoardString = [[NSMutableString alloc] init];
    [gameBoardString appendString:[self getMarkTypeString: gameBoard[index1]]];
    [gameBoardString appendString:[self getMarkTypeString: gameBoard[index2]]];
    [gameBoardString appendString:[self getMarkTypeString: gameBoard[index3]]];
    return gameBoardString;
}

-(MarkType) getGameBoardMarkAtIndex: (NSInteger) index{
    return gameBoard[index];
}

-(NSString*) description{
    return [NSString stringWithFormat:@"%@ Board: %@", [self getGameStateString], [self getGameString]];
}

@end
