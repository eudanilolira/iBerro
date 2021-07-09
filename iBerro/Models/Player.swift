//
//  Player.swift
//  iBerro
//
//  Created by Danilo Araújo on 09/07/21.
//

import Foundation

struct Player: Codable, Comparable {
    var status: PlayerStatus = .waiting
    var score: Int = 0
    var displayName: String
    var isHost: Bool
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        lhs.score < rhs.score
    }
    
}

enum PlayerStatus: String, Codable {
    case singing
    case watching
    case evaluating
    case waiting
    case ready
}
