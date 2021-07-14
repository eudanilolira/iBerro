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
    @State var nextScreen: Bool = false
    
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
            
            Button(action: {
                nextScreen.toggle()
            }, label: {
                Text("Play Music Now")
            })
        }
        .popover(isPresented: $nextScreen) {
            MusicPlayer()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
