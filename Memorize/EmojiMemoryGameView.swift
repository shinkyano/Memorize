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
                .foregroundStyle(viewModel.color)
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: cardAspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}


