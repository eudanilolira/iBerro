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
    @State var musicGenre: String = ""
    @State var highScore: String = ""
    
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
    var body: some View {
        
        ZStack{
            Image("Background2")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Button(action: {
                        delegate!.leaveViewController()
                    }, label: {
                        ZStack(alignment: .center){
                            Image("BgButtonLeave")
                                .resizable()
                            
                            
                            Text("LEAVE".localized())
                                .font(Font.custom("Pexico", size: 36))
                                .foregroundColor(.white)
                                .padding(.bottom, 10)
                        }
                    }) .frame(width: 300, height: 160)
                    
                    Spacer()
                }
                ZStack{
                    Image("BgSelectionBox")
                        .resizable()
                        .frame(minWidth: 550, idealWidth: 550, maxWidth: 825, minHeight: 300, idealHeight: 400, maxHeight: 450, alignment: .center)
                    
                    VStack{
                        Text("Music Genre".localized())
                            .font(Font.custom("Pexico", size: 36))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        CheckboxView(type: .musicGender, list: ["Rock", "Pop", "Samba"], selected: $musicGenre)
                            .padding(.bottom)
                        
                        
                        
                        Text("High Score".localized())
                            .font(Font.custom("Pexico", size: 35))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        CheckboxView(type: .maxScore, list: ["100", "200", "300", "400"], selected: $highScore)
                    }
                } .frame(minWidth: 550, idealWidth: 550, maxWidth: 825, minHeight: 300, idealHeight: 400, maxHeight: 450, alignment: .center)
                
                UIGrid(showInviteButton: self.$showInviteButton, showInviteModal: self.$showInviteModal, columns: 3, list: self.lobbyViewModel.invitedPlayers) { player in
                    VStack {
                        RoundProfileView(profile: player.photo, name: player.displayName)
                    }
                    
                } .frame(width: 700, height: 400, alignment: .center)
                
                Spacer()
                
                Button(action: {
                        self.delegate!.startMatch(
                            musicGenre: musicGenre,
                            highScore: highScore
                        )}, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                            .resizable()
                        
                        Text("Start Game".localized())
                            .font(Font.custom("Pexico", size: 36))
                            .foregroundColor(.white)
                            .padding(.bottom, 15)
                    }
                })
//                .disabled(true)
                .frame(width: 390, height: 190, alignment: .center)
            }
            
            if (showInviteModal) {
                Button(action: {self.showInviteModal = false}, label: {
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.4)
                })

                InvitePlayersModalView(viewModel: self.lobbyViewModel, delegate: self.delegate, showInviteModal: self.$showInviteModal, players: self.$lobbyViewModel.players, showInviteButton: self.$showInviteButton)
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
