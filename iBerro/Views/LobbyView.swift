//
//  LobbyVIew.swift
//  iBerro
//
//  Created by Danilo Araújo on 15/07/21.
//

import SwiftUI

struct LobbyView: View {
    var delegate: LobbyViewController
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(action: {delegate.createMatch()}, label: {
            Text("Adiciona players a partida")
        })
    }
}

//struct LobbyVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        LobbyView()
//    }
//}
