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
    
    var body: some View {
        
        ZStack{
            Image("Background2")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Button(action: {delegate?.createMatch()}, label: {
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
                        .frame(minWidth: 0, idealWidth: 1048, maxWidth: .infinity, minHeight: 0, idealHeight: 700, maxHeight: .infinity, alignment: .center)
                    
                    VStack{
                        Text("Music Genre".localized())
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        CheckboxView(type: .musicGender, list: ["Rosk", "Pop", "Imagine Dragons"])
                        
                        Text("High Score".localized())
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        CheckboxView(type: .maxScore, list: ["100", "200", "300"])
                    }
                }
                
                UIGrid(columns: 3, list: self.lobbyViewModel.players) { player in
                    VStack{
                        RoundProfileView(profile: player.photo, name: player.displayName)
                    }
                }
                
                Spacer()
                
                Button(action: {}, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                            .resizable()
                        
                        Text("Start Game".localized())
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 25)
                    }
                })
                .disabled(true)
                .frame(width: 290, height: 145.5, alignment: .center)
            }
            
            if (showInviteModal) {
                InvitePlayersModalView(players: self.lobbyViewModel.players)
            }
            
        }
        
    }
}

//struct LobbyView_Previews: PreviewProvider {
//    static var previews: some View {
//        LobbyView(lobbyViewModel: LobbyViewModel())
//    }
//}
