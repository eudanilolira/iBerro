//
//  InvitePlayersModalView.swift
//  iBerro
//
//  Created by Danilo Araújo on 21/07/21.
//

import SwiftUI

struct InvitePlayersModalView: View {
    @State var players: [Player]
    
    var body: some View {
        ZStack {
            Color(hex: "#1D0426").ignoresSafeArea()
            
            VStack {
                Text("Select your friends".localized())
                
                ScrollView(.vertical, showsIndicators: true){
                    ForEach(self.players) { player in
                        HStack {
                            RoundProfileView(profile: player.photo, name: player.displayName)
                            
                            Image("BgCheckbox")
                                .resizable()
                                .frame(width: 184, height: 184, alignment: .trailing)
                        }
                    }
                    
                }
                
                
                Button(action: {}, label: {
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
