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
    @State var currentScreen: String?
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            
            Text("Teste")
            
            NavigationLink(destination: LoadingView(), tag: "loadView", selection: $currentScreen) { EmptyView() }
            
            NavigationLink(destination: PlayingView(matchDelegate: matchDelegate, game: game), tag: "playingView", selection: $currentScreen) { EmptyView() }
            
        }.navigationBarHidden(true)
        
        .onReceive(timer) { time in
            if game.model.arePlayersReady() {
//                game.model.players[0].status = .singing
//
//                for i in 1..<game.model.players.count {
//                    game.model.players[i].status = .watching
//                }
                
                currentScreen =  "playingView"
            }
            
        }
    }
}
