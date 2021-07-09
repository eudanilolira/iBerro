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
}

extension GameModel {
    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    static func decode(data: Data) -> GameModel? {
        return try? JSONDecoder().decode(GameModel.self, from: data)
    }
}
