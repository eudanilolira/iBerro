//
//  LobbyVIew.swift
//  iBerro
//
//  Created by Danilo Araújo on 15/07/21.
//

import SwiftUI
import GameKit

struct LobbyView: View {
    
    var delegate: LobbyViewController?
    @ObservedObject var lobbyViewModel: LobbyViewModel
    @State var showInviteModal: Bool = false
    @State var showInviteButton: Bool = true
    
    var body: some View {
        
        ZStack{
            Image("Background2")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Button(action: {}, label: {
                        ZStack(alignment: .center){
                            Image("BgButtonSignOut")
                                .resizable()
                            Text("Leave")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.bottom)
                        }
                    }).frame(width: 290, height: 145.5, alignment: .center)
                    
                    Spacer()
                }
                ZStack{
                    Image("BgSelectionBox")
                        .resizable()
//                        .frame(minWidth: 0, idealWidth: 1048, maxWidth: .infinity, minHeight: 0, idealHeight: 700, maxHeight: .infinity, alignment: .center)
                    
                    VStack{
                        Text("Music Genre".localized())
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            //.padding(.top)
                        
                        CheckboxView(type: .musicGender, list: ["Rock", "Pop", "Samba"])
                        
                        Text("High Score".localized())
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        CheckboxView(type: .maxScore, list: ["100", "200", "300", "400"])
                    }
                }
                
                UIGrid(showInviteButton: self.$showInviteButton, showInviteModal: self.$showInviteModal, columns: 3, list: self.lobbyViewModel.invitedPlayers) { player in
                    VStack {
                        RoundProfileView(profile: player.photo, name: player.displayName)
                    }
                    
                }
                
                Spacer()
                
                Button(action: {self.delegate!.startMatch()}, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                            .resizable()
                        
                        Text("Start Game".localized())
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 25)
                    }
                })
//                .disabled(true)
                .frame(width: 290, height: 145.5, alignment: .center)
            }
            
            if (showInviteModal) {
                Button(action: {self.showInviteModal = false}, label: {
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.4)
                })

                InvitePlayersModalView(viewModel: self.lobbyViewModel, delegate: self.delegate, showInviteModal: self.$showInviteModal, showInviteButton: self.$showInviteButton)
                    .frame(width: 600, height: 740, alignment: .center)
            }
            
        }
        
    }
}

//struct LobbyView_Previews: PreviewProvider {
//    static var previews: some View {
//        LobbyView(lobbyViewModel: LobbyViewModel())
//    }
//}
