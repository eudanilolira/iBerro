//
//  GameModel.swift
//  iBerroApp
//
//  Created by Danilo Araújo on 08/07/21.
//

import Foundation
import UIKit
import GameKit

struct GameModel: Codable {
    var players: [Player] = []
    var room: Room
    
    func highScore() -> Int {
        players.max()?.score ?? 0
    }
    
    func ranking() -> [Player] {
        players.sorted(by: >)
    }
    
    func arePlayersReady() -> Bool {
        let playersReady = players.filter { player in
            player.status == .ready
        }
        
        return playersReady.count == players.count ? true : false
    }
    
    func localPlayer() -> Player {
        let gkLocalPlayer = GKLocalPlayer.local
        
        let player = players.first(where: { player in
            player.displayName == gkLocalPlayer.displayName
        })
        
        return player!
    }
    
    func playerIndex(from name: String) -> Int {
        for i in 0..<players.count {
            if players[i].displayName == name {
                return i
            }
        }
        
        return -1
    }
    
    mutating func setPlayerStatus(name: String, status: PlayerStatus) {
        for i in 0..<players.count {
            if players[i].displayName == name {
                players[i].status = status
                break
            }
        }
    }
}

extension GameModel {
    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    static func decode(data: Data) -> GameModel? {
        return try? JSONDecoder().decode(GameModel.self, from: data)
    }
}
