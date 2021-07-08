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
    
    var body: some View {
        Text(matchDelegate.match?.players.first?.displayName ?? "Nenhum player foi encontrado")
        Button(action: {matchDelegate.sendData()}, label: {Text("Enviar Dados")})
        Text("\(game.model.time)")
            .bold()
    }
}

