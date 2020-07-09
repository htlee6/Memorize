//
//  MemoryGame.swift
//  Memorize
//
//  Created by 李昊天 on 2020/5/31.
//  Copyright © 2020 HauTen Lee. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable { // costraints and gains
    var cards: Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                // newValue is a var only appears in set method
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        let maxIndex = 2 * numberOfPairsOfCards - 1
        var pairIndices = [Int]()
        for i in 0...maxIndex {
            let randomNumber = Double.random(in: 0...1)
            if randomNumber >= 0.5 {
                pairIndices.insert(i/2, at: 0)
            } else {
                pairIndices.append(i/2)
            }
        }
        for i in 0...maxIndex {
            let pairIndex = pairIndices[i]
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: i, content: content))
        }
    }
                    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // comma here is like a sequential "AND"
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content ==  cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            self.cards[chosenIndex].isFaceUp = true
        }
    }
    
    struct Card: Identifiable {
        /* Member variable 'id' is essential for the Identifiable protocol */
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
