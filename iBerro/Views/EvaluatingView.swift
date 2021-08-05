//
//  EvaluatingView.swift
//  iBerro
//
//  Created by Meyrillan Silva on 19/07/21.
//

import Foundation
import SwiftUI

struct EvaluatingView: View {
    var matchDelegate: GameViewController
    
    @ObservedObject var game: GameViewModel
    @State private var timeRemaining = 10
    @Binding var currentScreen: String
    @Environment(\.presentationMode) var presentation
    
    @State var votedPlayersCount: Int = 0
    var playersCount: Int
    
    var localPlayerIndex: Int?
    var player: Player
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(matchDelegate: GameViewController, game: GameViewModel, currentScreen: Binding<String>) {
        self.matchDelegate = matchDelegate
        self.game = game
        self.playersCount = game.model.players.count - 1
        self._currentScreen = currentScreen
        player = game.model.players.first(where: { player in
            player.status == .singing
        })!
        
        self.localPlayerIndex = game.model.players.firstIndex(of: game.model.localPlayer())
    }
    
    var body: some View {
        
        ZStack{
            
            Image("BgMenu")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                if timeRemaining > 0 {
                    
                    Text("\(timeRemaining)")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 60)
                        
                    
                } else {
                    // Aqui vai entrar a navegação, e o voto do jogador não foi computado
                }
                
                Text("\(votedPlayersCount)/\(playersCount) votaram")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom)
                
                PlayersView(players: $game.model.players)
                    .frame(minWidth: 300, idealWidth: 450, maxWidth: 600, minHeight: 300, idealHeight: 400, maxHeight: 450, alignment: .center)
                    .padding()
                
                // trocar para o display.name do jogador da vez
                Text("Eae, \(self.player.displayName) cantou certo?")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .frame(width: 450, height: 200, alignment: .bottom)

                
                HStack {
                    Button(action: {
                        //Ir pra próxima tela (ranking)
                        self.voteAction(vote: false)
                        
                    }, label: {
                        ZStack{
                            Image("BgButtonWrong")
                                .resizable()
                            
                            Text("WRONG".localized())
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 25)
                        }
                    })
                    
                    Button(action: {
                        self.voteAction(vote: true)
                        
                    }, label: {
                        ZStack{
                            Image("BgButtonRight")
                                .resizable()
                            
                            Text("RIGHT".localized())
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 25)
                        }
                    })
                } .frame(minWidth: 300, idealWidth: 450, maxWidth: 600, minHeight: 100, idealHeight: 130, maxHeight: 150, alignment: .center)
                Spacer(minLength: 20)
                
            }
            
        }.onChange(of: game.model.players.filter({ player in
            player.status == .voted
        }), perform: { votedPlayers in
            votedPlayersCount = votedPlayers.count
            
            if votedPlayers.count == game.model.players.count - 1 {
                currentScreen = "rank"
                presentation.wrappedValue.dismiss()
            }
        })
    }
    
    func voteAction(vote: Bool) {
        self.game.model.players[localPlayerIndex!].vote = vote
        self.game.model.players[localPlayerIndex!].status = .voted
        self.matchDelegate.sendData()
    }
}
