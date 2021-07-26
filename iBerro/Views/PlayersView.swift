//
//  PlayersView.swift
//  iBerro
//
//  Created by Meyrillan Silva on 19/07/21.
//

import Foundation
import SwiftUI

struct PlayersView: View {
    
    @Binding var player: Player
    @Binding var players: [Player]
    
    @State var showInviteModal: Bool = false
    @State var showInviteButton: Bool = false
    
   var body: some View {
    //ForEach(self.matchDelegate.match!.players, id: \.self) { player in
    UIGrid(showInviteButton: $showInviteButton, showInviteModal: $showInviteModal, columns: 3, list: players) { player in
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
    }
        
    }
}
