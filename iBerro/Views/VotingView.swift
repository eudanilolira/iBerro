//
//  VotingView.swift
//  iBerro
//
//  Created by Meyrillan Silva on 15/07/21.
//

import SwiftUI
import Foundation

struct VotingView: View {
    
    var delegate: GameViewController?
    @ObservedObject var game: GameViewModel
    @State private var timeRemaining = 10
    @Binding var currentScreen: String
    
    var player: Player
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(game: GameViewModel, currentScreen: Binding<String>) {
        self.game = game
        self._currentScreen = currentScreen
        player = game.model.players.first(where: { player in
            player.status == .singing
        })!
    }
    
    
    
    var body: some View {
        
        ZStack{
            Image("BgMenu")
                .resizable()
            
            VStack{
                
                HStack{
                    Image(uiImage: UIImage(data: player.photo.image) ?? UIImage(named: "Group 3")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(
                            minWidth: 80,
                            idealWidth: 100,
                            maxWidth: 150,
                            minHeight: 80,
                            idealHeight: 100,
                            maxHeight: 150,
                            alignment: .top)
                        .padding([.top,.leading])
                    
                    Text("\(player.displayName.uppercased())'s TURN".localized())
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Spacer()
                }
                .padding([.top,.leading])
                Spacer(minLength: 60)
                
                PlayersView(players: $game.model.players)
                    .padding(.bottom, 100)
                
                Text("\("4") pessoas já votaram!")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer(minLength: 60)
            }
        } .ignoresSafeArea()
    }
    
}
