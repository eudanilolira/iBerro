//
//  gameView.swift
//  iBerroApp
//
//  Created by Danilo Araújo on 08/07/21.
//

import SwiftUI
import GameKit

struct GameView: View {
    var matchDelegate: GameViewController
    @ObservedObject var game: GameViewModel
    @State var speaking: GKPlayer?
    @State var chatState: String?
    @State var lastConnectedPlayer: GKPlayer?
    
    init(matchDelegate: GameViewController, game: GameViewModel) {
        self.matchDelegate = matchDelegate
        self.game = game
        
        self.matchDelegate.voiceChat?.playerVoiceChatStateDidChangeHandler = { player, state in
            switch state {
            case GKVoiceChat.PlayerState.connected:
                print("TO ENTRANDO")
            case GKVoiceChat.PlayerState.disconnected:
                print("Desconectei")
            case GKVoiceChat.PlayerState.speaking:
                print("TO ENTRANDO")
            case GKVoiceChat.PlayerState.silent:
                print("TO ENTRANDO")
            case GKVoiceChat.PlayerState.connecting:
                print("TO ENTRANDO")
            @unknown default:
                print("Nadinha")
            }
            return
        }
    }
    
    var body: some View {
        Text("Último jogador logado: \(lastConnectedPlayer?.displayName ?? "Nenhum")")
        Text("Quem está falando: \(speaking?.displayName ?? "Ninguém")")
        Text("Seu estado atual: \(chatState ?? "Não definido")")
        
        ForEach(self.matchDelegate.match!.players, id: \.self) { player in
            Button(
            action: {
                self.matchDelegate.voiceChat?.setPlayer(player, muted: true)
            }, label: {
                Text(player.displayName)
            })
        }
    }
}

