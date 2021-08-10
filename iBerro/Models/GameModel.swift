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
    var singingPlayerIndex: Int = -1
    
    func highScore() -> Int {
        players.max()?.score ?? 0
    }
    
    func ranking() -> [Player] {
        players.sorted(by: >)
    }
    
    mutating func arePlayersReady() -> Bool {
        let playersReady = players.filter { player in
            player.status == .ready
        }
        
        let ready = playersReady.count == players.count ? true : false
        return ready
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
    
    mutating func setSingingPlayer() {
        self.singingPlayerIndex += 1
        
        for i in 0..<players.count {
            if i == singingPlayerIndex {
                players[singingPlayerIndex].status = .singing
            } else {
                players[i].status = .watching
            }
        }
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
