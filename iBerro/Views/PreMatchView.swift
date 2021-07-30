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
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: LoadingView(), tag: "loadView", selection: $currentScreen) { EmptyView() }
            
            NavigationLink(destination: PlayingView(matchDelegate: matchDelegate, game: game), tag: "playingView", selection: $currentScreen) { EmptyView() }
            
        }.navigationBarHidden(true)
        
        .onChange(of: game.model.arePlayersReady(), perform: { value in
            print("valor: \(value)")
            currentScreen = value ? "playingView" : "loadView"
        })
    }
    

    
}
