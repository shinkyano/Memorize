//
//  MemoryGame.swift
//  Memorize
//
//  Created by Hervé PIERRE on 07/10/2023.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numerOfParirsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numerOfParirsOfCards x 2 cards
        
        for pairIndex in 0..<max(2, numerOfParirsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex+1)a", content: content))
            cards.append(Card(id: "\(pairIndex+1)b", content: content))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: String
        
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
    
}
