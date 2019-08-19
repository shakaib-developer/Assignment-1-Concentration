//
//  Concentration.swift
//  Concentration-Assignment1
//
//  Created by Shakaib Akhtar on 19/08/2019.
//  Copyright © 2019 iParagons. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var oneFaceUpOnlyIndex: Int?
    
    func flipCardInModel(at index: Int) {
        // things to check before flipping the card
        
        //if there is already one faceup card so check if the new tapped card is a different card then proceed
        if let matchIndex = oneFaceUpOnlyIndex, matchIndex != index {
            
            //if both the faceUpCards match then mark them as matched
            if cards[matchIndex].cardNumber == cards[index].cardNumber {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            
            oneFaceUpOnlyIndex = nil
        }
        else { // if there is no faceUp card
            // flip all cards as face down
            for cardIndex in 0..<cards.count {
                cards[cardIndex].isFaceUp = false
            }
            
            // select the oneFaceUpCardOnly index
            oneFaceUpOnlyIndex = index
        }
        
        // flip the card
        cards[index].isFaceUp = !cards[index].isFaceUp
    }
    
    init(noOfPairs: Int) {
        
        // create the pairs of cards
        for _ in 1...noOfPairs {
            let card = Card()
            cards += [card,card]
        }
        
        // TODO: Shuffle cards
    }
    
    
}
