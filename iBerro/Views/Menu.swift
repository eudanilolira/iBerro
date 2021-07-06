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
            Image("BgMenu")
            
            VStack {
                
                Image("Group 3").frame(minWidth: 150, idealWidth: 200, maxWidth: 300, minHeight: 150, idealHeight: 200, maxHeight: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.top)
                
                Spacer().frame(minWidth: 50, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 150, minHeight: 20, idealHeight: 40, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                ZStack {
                    Image("BgNameMenu")
                    
                    Text("PedrinhoFast")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    
                }.frame(minWidth: 80, idealWidth: 200, maxWidth: 400, minHeight: 20, idealHeight: 50, maxHeight: 70, alignment: .center)
                
                Spacer().frame(minWidth: 80, idealWidth: 150, maxWidth: 200, minHeight: 80, idealHeight: 200, maxHeight: 250, alignment: .center)
                
                Button(action: {print("Entrou em uma sala")}, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                        Text("Sign in Room").font(.title).foregroundColor(.white)
                    }
                })
                
                Button(action: {self.showRoom.toggle()}, label: {
                    ZStack{
                        Image("BgButtonCreateRoom")
                        Text("Create Room").font(.title).foregroundColor(.white)
                    }
                })
                
                
            }.padding()
            
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
