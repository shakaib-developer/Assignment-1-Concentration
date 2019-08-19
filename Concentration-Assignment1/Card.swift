//
//  Card.swift
//  Concentration-Assignment1
//
//  Created by Shakaib Akhtar on 19/08/2019.
//  Copyright © 2019 iParagons. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var cardNumber: Int
    
    static var uniqueCardNumber = 0
    
    static func getUniqueCardNum() -> Int {
        uniqueCardNumber += 1
        return uniqueCardNumber
    }
    
    init() {
        self.cardNumber = Card.getUniqueCardNum()
    }
}
