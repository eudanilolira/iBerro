//
//  InvitePlayersModalView.swift
//  iBerro
//
//  Created by Danilo Araújo on 21/07/21.
//

import SwiftUI
import GameKit

struct InvitePlayersModalView: View {
    @State var viewModel: LobbyViewModel
    @State var delegate: LobbyViewController?
    @Binding var showInviteModal: Bool
    @Binding var players: [Player]
    @Binding var showInviteButton: Bool
    
    var body: some View {
        ZStack {
            Color(hex: "#1D0426").ignoresSafeArea()
            
            VStack {
                Text("Select your friends".localized())
                    .font(Font.custom("Pexico", size: 36))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true){
                    ForEach(players) { player in
                        if player.displayName != GKLocalPlayer.local.displayName {
                            HStack {
                                RoundProfileView(profile: player.photo, name: player.displayName)
                                
                                Spacer()
                                
                                Button(action: {
                                    self.viewModel.checkPlayer(player: player)
                                    
                                }, label: {
                                    Image(player.invited ? "BgCheckboxSelected" : "BgCheckbox")
                                        .resizable()
                                        .frame(width: 32, height: 32, alignment: .trailing)
                                })
                                
                            }.padding(.horizontal)
                        }
                    }
                    
                }
                
                
                Button(action: {
                    self.viewModel.invitePlayers()
                    self.delegate!.createMatch()
                    self.showInviteModal = false
                    self.showInviteButton = false
                    
                }, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                            .resizable()
                        
                        Text("Invite".localized())
                            .font(Font.custom("Pexico", size: 36))
                            .foregroundColor(.white)
                            .padding(.bottom, 12)
                    }
                })
                .frame(width: 290, height: 130, alignment: .center)
            }
        }
    }
}

//struct InvitePlayersModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        InvitePlayersModalView()
//    }
//}
