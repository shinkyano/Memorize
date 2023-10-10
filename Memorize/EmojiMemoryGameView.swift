//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Hervé PIERRE on 28/09/2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let cardAspectRatio: CGFloat = 2/3
    
    //@ViewBuilder is implicit
    var body: some View {
        VStack {
                cards
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    @ViewBuilder
    var cards: some View {

        GeometryReader{ geometry in
            let gridItemSize = gridItemWidthThatFit(
                count: viewModel.cards.count,
                size: geometry.size,
                aspectRatio: cardAspectRatio
            )
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0){
                ForEach(viewModel.cards.indices, id: \.self) { index in
                    CardView(viewModel.cards[index])
                        .aspectRatio(cardAspectRatio, contentMode: .fit)
                        .padding(4)
                }
            }
            
        }
        .foregroundStyle(.orange)
    }
    
    func gridItemWidthThatFit(count: Int,
                              size: CGSize,
                              aspectRatio: CGFloat
    ) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height {
                return (size.width / columnCount).rounded(.down)
            }
            columnCount += 1
            
        } while columnCount < count

        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}


