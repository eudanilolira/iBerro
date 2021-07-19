//
//  LobbyVIew.swift
//  iBerro
//
//  Created by Danilo Araújo on 15/07/21.
//

import SwiftUI

struct LobbyView: View {
    var delegate: LobbyViewController
    @ObservedObject var lobbyViewModel: LobbyViewModel
    
    init(delegate: LobbyViewController) {
        self.delegate = delegate
        self.lobbyViewModel = delegate.lobbyVM
    }
    var body: some View {
        VStack {
            Button(action: {delegate.createMatch()}, label: {
                Text("Chamar jogadores")
            })
            
            Button(action: {delegate.startMatch()}, label: {
                Text("Começar partida")
            })
        }
        
        ForEach(lobbyViewModel.invitablePlayers, id: \.self) { player in
            Button(
                action: {
                    delegate.invitePlayer(player: player)
                },
                label: {
                    Text(player.displayName)
                }).disabled(lobbyViewModel.invitedPlayers.contains(player) ? true : false)
        }

    }
}

//struct LobbyVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        LobbyView()
//    }
//}
