//
//  PlayersView.swift
//  iBerro
//
//  Created by Meyrillan Silva on 19/07/21.
//

import Foundation
import SwiftUI

struct PlayersView: View {
    
    @Binding var players: [Player]
    @State var showInviteModal: Bool = false
    @State var showInviteButton: Bool = false
    
   var body: some View {
    UIGrid(showInviteButton: $showInviteButton, showInviteModal: $showInviteModal, columns: 3, list: players) { player in
        
        if (player.status == .watching || player.status == .voted) {
            VStack{
                Image(uiImage: UIImage(data: player.photo.image) ?? UIImage(systemName: "person.crop.circle")!)
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
                
                Text("\(player.displayName.uppercased())".localized())
                    .font(Font.custom("Pexico", size: 24))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding([.leading,.trailing])
            }
        }
    }
        
    }
}
