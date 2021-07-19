//
//  GameViewModel.swift
//  iBerroApp
//
//  Created by Danilo Araújo on 08/07/21.
//

import Foundation
import GameKit

class LobbyViewModel: ObservableObject {
    @Published var invitedPlayers: [GKPlayer] = []
    var invitablePlayers: [GKPlayer] = []
    
    init() {
        GKLocalPlayer.local.loadChallengableFriends(completionHandler: { (players, error) in
            if let playersList = players {
                self.invitablePlayers = playersList
            }
        })
    }
}
