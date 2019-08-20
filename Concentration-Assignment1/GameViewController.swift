//
//  ViewController.swift
//  Concentration-Assignment1
//
//  Created by Shakaib Akhtar on 19/08/2019.
//  Copyright © 2019 iParagons. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        reset()
    }
    
    // start a new game
    var game: Concentration?// = Concentration(noOfPairs: cardButtons.count / 2)
    
//    var flipCount: Int? {
//        didSet {
//            flipCountsLabel.text = "Flips: \(flipCount!)"
//        }
//    }//= 0
    var score: Int? {
        didSet {
            scoreLabel.text = "Score: \(score!)"
        }
    }//= 0
    
    var matchedPairs = 0
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountsLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func newGameButton(_ sender: UIButton) {
        //reset()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func touchCard(_ sender: UIButton) {
//        flipCount! += 1
        
        if let index = cardButtons.index(of: sender) {
            let selectedCard = game!.cards[index]
            
            game!.flipCardInModel(at: index)
            updateViewFromModel()
            let calcMatchedPairs = game!.cards.filter { $0.isMatched }.count
            if matchedPairs < calcMatchedPairs {
                score! += 2
                matchedPairs = calcMatchedPairs
            }
            else if selectedCard.isSeen {
                if game!.oneFaceUpOnlyIndex == nil {
                    score! -= 1
                }
            }
        }
        
        flipCountsLabel.text = "Flips : \(game!.flipCount)"
                
        if isGameOver() {
            reset()
        }
    }
    
    func reset() {
        game = Concentration(noOfPairs: cardButtons.count / 2)
        cardButtons.forEach({$0.isEnabled = true; $0.alpha = 1.0; $0.backgroundColor = btnBGColor; $0.setTitle("", for: UIControlState.normal)})
        emojis = theme//["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
        //flipCount = 0
        score = 0
        matchedPairs = 0
        flipCountsLabel.text = "Flips : 0"
        scoreLabel.text = "Score : 0"
    }
    
    func isGameOver() -> Bool {
        var res: Bool = true
        for index in cardButtons.indices {
            if cardButtons[index].isEnabled {
                res = false
                break
            }
        }
        return res
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game!.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiForButton(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.isEnabled = false
            }
            else {
                if card.isMatched {
                    button.setTitle("✅", for: UIControlState.normal)
                    button.alpha = 0.5
                    button.isEnabled = false
                    button.backgroundColor = btnBGColor
                }
                else {
                    button.setTitle("", for: UIControlState.normal)
                    button.isEnabled = true
                    button.backgroundColor = btnBGColor
                }
            }
        } 
    }
    
    var emoji = [Int: String]()
    
    func emojiForButton(for card: Card) -> String {
        
        // if the emoji against cardNumber is not set and emojis array contains elements
        if emoji[card.cardNumber] == nil, emojis.count > 0 {
            
            // assign random emoji from emoji array to the selected cardNumber
            emoji[card.cardNumber] = emojis.remove(at: (emojis.count - 1).arc4random())
        }
        
        return emoji[card.cardNumber] ?? "?"
    }
    
    var theme = [String]() {
        didSet {
            emojis = theme
        }
    }// = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    lazy var emojis = theme
    var btnBGColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
}

extension Int {
    
    // function returns random integer from 0 to the number from which this function will be called
    func arc4random() -> Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {
            return 0
        }
    }
}
