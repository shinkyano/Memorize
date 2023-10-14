//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Hervé PIERRE on 07/10/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    
    static func createMemoryGame() -> MemoryGame<String>  {
        return MemoryGame(numerOfParirsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "❗️❓"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var color: Color = .orange
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }

    func choose(_ card: Card) {
        model.choose(card)
    }
}
