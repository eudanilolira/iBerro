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
    
   var body: some View {
        HStack{
            Image(uiImage: UIImage(data: player.photo.image) ?? UIImage(named: "Group 3")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(
                    minWidth: 50,
                    idealWidth: 100,
                    maxWidth: 200,
                    minHeight: 50,
                    idealHeight: 100,
                    maxHeight: 200,
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
    }
}
