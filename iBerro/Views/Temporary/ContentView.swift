//
//  ContentView.swift
//  iBerroApp
//
//  Created by Danilo Araújo on 08/07/21.
//

import SwiftUI
import GameKit

struct ContentView: View {
    var gameCenterDelegate: SceneDelegate?
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            Button(action: {
                    gameCenterDelegate!.criarPartida()
            } ,
            label: {
                Text("Teste")
            })
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
