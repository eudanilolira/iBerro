//
//  InvitePlayersModalView.swift
//  iBerro
//
//  Created by Danilo Araújo on 21/07/21.
//

import SwiftUI

struct InvitePlayersModalView: View {
    @State var viewModel: LobbyViewModel
    
    var body: some View {
        ZStack {
            Color(hex: "#1D0426").ignoresSafeArea()
            
            VStack {
                Text("Select your friends".localized())
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true){
                    ForEach(self.viewModel.players) { player in
                        HStack {
                            RoundProfileView(profile: player.photo, name: player.displayName)
                            
                            Spacer()
                            
                            Button(action: {
                                self.viewModel.checkPlayer(player: player)
                            }, label: {
                                Image(player.invited ? "BgCheckboxSelected" : "BgCheckbox")
                                    .resizable()
                                    .frame(width: 60, height: 60, alignment: .trailing)     
                            })
                            
                        }.padding(.horizontal)
                    }
                    
                }
                
                
                Button(action: {
                        self.viewModel.invitePlayers()
                    
                }, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                            .resizable()
                        
                        Text("Invite".localized())
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 25)
                    }
                })
                .frame(width: 290, height: 145.5, alignment: .center)
            }
        }
    }
}

//struct InvitePlayersModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        InvitePlayersModalView()
//    }
//}
