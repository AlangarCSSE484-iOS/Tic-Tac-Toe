//
//  TicTacToeGame.h
//  Tic-Tac-Toe
//
//  Created by CSSE Department on 3/27/18.
//  Copyright © 2018 Rose-Hulman. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, MarkType){
    MarkTypeNone,
    MarkTypeX,
    MarkTypeO
};

typedef NS_ENUM(NSInteger, GameState) {
    GameStateXTurn,
    GameStateoTurn,
    GameStateXWon,
    GameStateOWin,
    GameStateTie
    
};

@interface TicTacToeGame : NSObject {
    MarkType gameBoard[9];
}

@property (nonatomic) GameState gameState;

-(NSString*) getGameStateString;
-(NSString*) getMarkTypeString: (MarkType) mark;
-(void) pressedSquare:(NSInteger) index;
-(MarkType) getGameBoardMarkAtIndex: (NSInteger) index;


@end
