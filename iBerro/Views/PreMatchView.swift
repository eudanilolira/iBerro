//
//  PreMatchView.swift
//  iBerro
//
//  Created by Danilo Araújo on 30/07/21.
//

import SwiftUI

struct PreMatchView: View {
    var matchDelegate: GameViewController
    @ObservedObject var game: GameViewModel
    @State var playersAreReady: Bool = false
    @State var currentScreen: String
    
    var body: some View {
        switch currentScreen {
        case "loading":
            LoadingView()
        case "playing":
            PlayingView(matchDelegate: matchDelegate, game: game, currentScreen: $currentScreen)
        case "voting":
            VotingView(game: game, currentScreen: $currentScreen)
        case "evaluating":
            EvaluatingView(game: game, currentScreen: $currentScreen)
        case "rank":
            RankView(game: game, currentScreen: $currentScreen)
        case "result":
            ResultView(game: game, currentScreen: $currentScreen)
        default:
            LoadingView()
        }
    }
}
