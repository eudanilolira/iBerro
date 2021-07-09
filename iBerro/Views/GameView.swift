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
    var voiceChat: GKVoiceChat?
    @ObservedObject var game: GameViewModel
    @State var voiceState: String = ""
    
    init(matchDelegate: GameViewController, game: GameViewModel) {
        self.matchDelegate = matchDelegate
        self.game = game
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setActive(true, options: [])
            
            voiceChat = matchDelegate.match?.voiceChat(withName: "Teste")
            voiceChat?.volume = 1
            voiceChat?.start()
            voiceChat?.isActive = true
            enterVoiceChat()
            print("Entrei no Chat")
        }
        catch {
            return
        }
    }
    
    func enterVoiceChat() {
        voiceChat?.playerVoiceChatStateDidChangeHandler = { player, state in
            switch state {
            case GKVoiceChat.PlayerState.connected:
                voiceState = "Connected"
            case GKVoiceChat.PlayerState.disconnected:
                voiceState = "DisConnected"
            case GKVoiceChat.PlayerState.speaking:
                voiceState = "Speaking"
            case GKVoiceChat.PlayerState.silent:
                voiceState = "Silent"
            case GKVoiceChat.PlayerState.connecting:
                voiceState = "Connecting"
            @unknown default:
                voiceState = "Default"
            }
            return
        }
    }
    
    var body: some View {
        Text(GKLocalPlayer.local.displayName)
        Text("Estado do VoiceChat: \(voiceState)")
        Button(action: {enterVoiceChat()}, label: {Text("Enviar Dados")})
        
        VStack {
            ForEach(0..<game.model.players.count, id: \.self) { index in
                Text("\(game.model.players[index].displayName): \(game.model.players[index].score)")
                    .bold()
            }
        }
        
//        SoundVisualizer()
    }
}

