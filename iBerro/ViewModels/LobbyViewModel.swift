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
    @Published var invitedPlayers: [Player] = []
    
    private var gkPlayers: [GKPlayer] = []
    var matchRequest: GKMatchRequest
    
    init(matchRequest: GKMatchRequest) {
        self.matchRequest = matchRequest
        let playerLocal = GKLocalPlayer.local
        
        //Possível bug com esse isHost true, pq caso outro jogador abra o lobby ele seria host tbm
        playerLocal.loadPhoto(for: .normal, withCompletionHandler: { image, error in
            
            let player = Player(
                id: 0,
                displayName: playerLocal.displayName,
                isHost: true,
                photo: ImageWrapper (photo: image!),
                invited: false
            )
            
            self.players.append(player)
            self.invitedPlayers.append(player)
        })
        
        GKLocalPlayer.local.loadChallengableFriends(completionHandler: { (players, error) in
            self.gkPlayers = players! //TODO: LIDAR COM POSSÍVEIS ERROS
            
            for i in 0..<players!.count {
                
                let player = players![i]
                
                player.loadPhoto(for: .normal, withCompletionHandler: { image, error in
                    self.players.append(Player(id: i, displayName: player.displayName, isHost: false, photo: ImageWrapper (photo: image!)))
                })
                

                
            }
        })
    }
    
    func checkPlayer(player: Player) {
        for i in 0..<self.players.count{
            if (player == self.players[i]) {
                self.players[i].toggleInvite()
            }
        }
    }
    
    func invitePlayers() {
        let invitedPlayers = self.players.filter({ player in
            player.invited
        })
        
        let gkInvitedPlayers = self.gkPlayers.filter({ gkPlayer in
            invitedPlayers.contains(where: { $0.displayName == gkPlayer.displayName})
        })
        
        self.invitedPlayers = invitedPlayers
        self.matchRequest.recipients = gkInvitedPlayers
    }
}
