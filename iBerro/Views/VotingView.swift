//
//  VotingView.swift
//  iBerro
//
//  Created by Meyrillan Silva on 15/07/21.
//

import SwiftUI
import Foundation

struct VotingView: View {
    
    //    @ObservedObject var gameViewModel: GameViewModel
    var gameCenterDelegate: SceneDelegate?
    @State var player: Player
    @State var players: [Player]
    
    init(player: Player) {
        self.player = player
        
        // players fake pra testar o grid!
        players = [player,player,player,player,player,player]
    }
    
    var body: some View {
        
        ZStack{
            Image("BgMenu")
                .resizable()
            
            VStack{
                
                PlayersView(player: $player, players: $players)
                
                //ForEach(self.matchDelegate.match!.players, id: \.self) { player in
                UIGrid(columns: 3, list: players) { player in
                    VStack{
                        Image("Group 3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(
                                minWidth: 50,
                                idealWidth: 100,
                                maxWidth: 150,
                                minHeight: 50,
                                idealHeight: 100,
                                maxHeight: 150,
                                alignment: .bottom)
                        
                        Text("\(player.displayName.uppercased())'s TURN".localized())
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .padding([.leading,.trailing])
                    }
                } .padding(.bottom, 100)
                
                Text("\(player.displayName) já votaram!")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
        }
    }
    
}
