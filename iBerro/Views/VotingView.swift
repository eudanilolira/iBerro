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
                Spacer()
                
                PlayersView(players: $players)
                .padding(.bottom, 200)
                
                Text("\("4") pessoas já votaram!")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
        } .ignoresSafeArea()
    }
    
}
