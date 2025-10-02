import UIKit

//Day 12 de 100 dias con SwiftUI

class Game {
    var score = 0 {
        didSet {
            print("Score: \(score)")
        }
    }
}

var newGame = Game()
newGame.score = 10
newGame.score = 20 
