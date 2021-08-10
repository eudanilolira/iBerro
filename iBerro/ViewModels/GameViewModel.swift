//
//  GameViewModel.swift
//  iBerroApp
//
//  Created by Danilo Araújo on 08/07/21.
//

import Foundation
import GameKit

class GameViewModel: ObservableObject{
    
    @Published var model: GameModel
    @Published var speaking: GKPlayer?
    @Published var myState: String = ""
    @Published var ranking: [Player] = []
    @Published var singIndex: Int = 0
    @Published var turn: Int = 1
    @Published var songs: [Song] = []
    
    
    init(players: [Player], room: Room) {
        self.model = GameModel(players: players, room: room)
    }
    
    func nextSingIndex(){
        if singIndex == model.players.count - 1 {
            singIndex = 0
            turn += 1
        } else {
            singIndex += 1
        }
    }
    
    func setRanking() {
        self.ranking = self.model.ranking()
    }
    
    func chatState(player: GKPlayer, state: GKVoiceChat.PlayerState) {
        switch state {
            case GKVoiceChat.PlayerState.connected:
                self.myState = "\(player.displayName) Conectado"
                print("\(player.displayName) Conectado")
            case GKVoiceChat.PlayerState.disconnected:
                self.myState = "\(player.displayName) Desconectado"
                print("\(player.displayName) Desconectado")
            case GKVoiceChat.PlayerState.speaking:
                self.myState = "\(player.displayName) Speaking"
                print("\(player.displayName) Speaking")
            case GKVoiceChat.PlayerState.silent:
                self.myState = "\(player.displayName) Speaking"
                print("\(player.displayName) Silent")
            case GKVoiceChat.PlayerState.connecting:
                print("TO ENTRANDO")
            @unknown default:
                print("Nadinha")
            }
            return
    }
}
