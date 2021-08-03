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
    @Environment(\.presentationMode) var presentation
    @State var votedPlayersCount: Int = 0
    
    var player: Player
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(game: GameViewModel, currentScreen: Binding<String>, delegate: GameViewController) {
        self.game = game
        self._currentScreen = currentScreen
        self.delegate = delegate
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
                
                Text("\(votedPlayersCount) pessoas já votaram!")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer(minLength: 60)
            }
        } .ignoresSafeArea()
        
    .onChange(of: game.model.players.filter({ player in
        player.status == .voted
    }), perform: { votedPlayers in
        votedPlayersCount = votedPlayers.count
        
        if votedPlayers.count == game.model.players.count - 1 {
            let singCorrect = votedPlayers.filter({ player in player.vote}).count
            
            calculateScore(correctVotes: singCorrect)
            currentScreen = "rank"
            presentation.wrappedValue.dismiss()
        }
        print("Mudou o array players!")
    })
    }
    
    func calculateScore(correctVotes: Int) {
        var score = correctVotes * 10
        
        if correctVotes == votedPlayersCount {
            score += 10
        }
        
        let index = game.model.playerIndex(from: player.displayName)
        game.model.players[index].score += score
        delegate!.sendData()
    }
    
}
