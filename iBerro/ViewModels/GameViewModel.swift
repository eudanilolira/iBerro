//
//  GameViewModel.swift
//  iBerroApp
//
//  Created by Danilo Araújo on 08/07/21.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var model: GameModel
    
    init(players: [Player], room: Room) {
        self.model = GameModel(players: players, room: room)
    }
}
