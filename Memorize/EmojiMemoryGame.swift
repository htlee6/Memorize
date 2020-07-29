//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 李昊天 on 2020/5/31.
//  Copyright © 2020 HauTen Lee. All rights reserved.
//

// import Foundation
import SwiftUI

/* This file works as ViewModel in MVVM. */
class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    private static func createMemoryGame() -> MemoryGame<String> {
        let pairsOfCards: Int = Int.random(in: 2...5)
        var possibleEmojis: Array<String> = ["👻", "🎃", "🕷", "👺", "🦇"]
        var emojis = [String]()
        for _ in 0..<pairsOfCards {
            let randomIndex = Int.random(in: 0..<possibleEmojis.count)
            let randomEmoji = possibleEmojis.remove(at: randomIndex)
            emojis.append(randomEmoji)
        }
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count,
                           cardContentFactory: {(pairIndex: Int) -> String in
                            return emojis[pairIndex]})
    }
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
