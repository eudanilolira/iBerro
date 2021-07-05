//
//  Menu.swift
//  iBerro
//
//  Created by Danilo Araújo on 01/07/21.
//

import SwiftUI
import GameKit

struct Menu: View {
    
    @State var showRoom: Bool = false
    
    var body: some View {
        ZStack {
            Button(action: {self.showRoom.toggle()}, label: { Text("Create Room")})
            
            if (showRoom) {
                GameCenterMatchmakerView(showRoom: self.$showRoom)
            }
        }
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
