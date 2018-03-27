//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by CSSE Department on 3/15/18.
//  Copyright © 2018 Rose-Hulman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var GameBoardButtons: [UIButton]!
    @IBOutlet weak var gameBoardImageView: UIImageView!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    @IBOutlet weak var gameStateLabel: UILabel!
    
    var game = TicTacToeGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStateNavBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 34)]
        if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact){
            print("Using iPhone board")
            gameBoardImageView.image = #imageLiteral(resourceName: "iPhone_board")
        } else {
            print("Using iPad board")
            gameBoardImageView.image = #imageLiteral(resourceName: "iPad_board")
        }
        updateView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedNewGame(_ sender: Any) {
        print("You pressed new game!")
        game = TicTacToeGame()
        updateView()
    }
    
    @IBAction func pressedGameBoardButton(_ sender: Any) {
//        guard let gameBoardButton = sender as? UIButton else {
//            return;
//        }
        let gameBoardButton = sender as! UIButton
        print(gameBoardButton.tag)
        game.pressedSquare(gameBoardButton.tag)
        updateView()
    }
    
    func updateView() {
        var xImage: UIImage
        var oImage: UIImage
        if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact){
           // print("Using iPhone board")
            gameStateLabel.text = game.getStateString()
            xImage = #imageLiteral(resourceName: "iPhone_X")
            oImage = #imageLiteral(resourceName: "iPhone_O")
        } else {
           // print("Using iPad board")
            gameStateNavBar.topItem?.title = game.getStateString()
            xImage = #imageLiteral(resourceName: "iPad_X")
            oImage = #imageLiteral(resourceName: "iPad_O")
        }
        
        for i in 0..<9 {
            let button = GameBoardButtons[i]
           // switch(game.getMarkTypeString(MarkType(rawValue: button.tag)!)) {
            switch( game.getBoardMark(at: i)){
                case .X:
                    button.setImage(xImage, for: UIControlState.normal)
                case .O:
                    button.setImage(oImage, for:UIControlState.normal)
                case .none:
                    button.setImage(nil, for: UIControlState.normal)
            }
        }
        print(game)
    }
    
}

