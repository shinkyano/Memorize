//
//  CardView.swift
//  Memorize
//
//  Created by Hervé PIERRE on 11/10/2023.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor: CGFloat = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 5
            static let inset: CGFloat = 5
        }
    }
    
}

typealias Card = CardView.Card
#Preview {
    VStack{
        HStack{
            CardView(Card(id: "test1", isFaceUp: true, content: "X"))
            CardView(Card(id: "test2", isMatched: true, content: "X"))
        }
        HStack{
            CardView(Card(id: "test1", isFaceUp: true, content: "This is a very long string and i hope it fits"))
            CardView(Card(id: "test2", isMatched: true, content: "X"))
        }
    }
        .padding()
        .foregroundColor(.green)
}
