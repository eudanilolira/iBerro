//
//  GameViewModel.swift
//  iBerroApp
//
//  Created by Danilo Araújo on 08/07/21.
//

import Foundation
import GameKit

class LobbyViewModel: ObservableObject {
    @Published var players: [Player] = []
    var matchRequest: GKMatchRequest
    
    init(matchRequest: GKMatchRequest) {
        self.matchRequest = matchRequest
        let playerLocal = GKLocalPlayer.local
        
        playerLocal.loadPhoto(for: .normal, withCompletionHandler: { image, error in
            self.players.append(Player(id: 0, displayName: playerLocal.displayName, isHost: false, photo: ImageWrapper (photo: image!)))
        })
        
        GKLocalPlayer.local.loadChallengableFriends(completionHandler: { (players, error) in
            self.matchRequest.recipients = players
            for i in 0..<players!.count {
                
                let player = players![i]
                
                player.loadPhoto(for: .normal, withCompletionHandler: { image, error in
                    self.players.append(Player(id: i, displayName: player.displayName, isHost: false, photo: ImageWrapper (photo: image!)))
                    print(self.players.last?.displayName)
                })
                
            }
        })
    }

}
