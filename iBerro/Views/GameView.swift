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
    
    init(matchDelegate: GameViewController, game: GameViewModel) {
        self.matchDelegate = matchDelegate
        self.game = game
        
        self.matchDelegate.voiceChat?.playerVoiceChatStateDidChangeHandler = { player, state in
            game.chatState(player: player, state: state)
        }
    }
    
    func leaveMatch() {
        GameCenterHelper.helper.match?.disconnect()
        matchDelegate.leaveGame()
    }
    
    var body: some View {
        Text("Estado do Chat:\(game.myState)")
        
        VStack {
            ForEach(GameCenterHelper.helper.match!.players, id: \.self) { player in
                Button(
                action: {
                    self.matchDelegate.voiceChat?.setPlayer(player, muted: true)
                }, label: {
                    Text(player.displayName)
                })
            }
            
            Button(action: {leaveMatch()}, label: {Text("Leave Match")})
        }

    }
}

