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
    
    var body: some View {
        if game.model.arePlayersReady(){
            PlayingView(matchDelegate: matchDelegate, game: game)
        } else {
            Text("Loading View")
//            LoadingView()
        }
    }
    
}
