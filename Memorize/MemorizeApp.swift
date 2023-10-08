//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Hervé PIERRE on 28/09/2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
