//
//  Menu.swift
//  iBerro
//
//  Created by Danilo Araújo on 01/07/21.
//

import SwiftUI
import GameKit

struct Menu: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        Button(action: {
            print(GKLocalPlayer.local.displayName)
        }, label: {
            Text("Estou autenticado?")
            
        })
        
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
