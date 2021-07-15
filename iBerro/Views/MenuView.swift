//
//  Menu.swift
//  iBerro
//
//  Created by Danilo Araújo on 01/07/21.
//
import SwiftUI
import GameKit

struct MenuView: View {
    var gameCenterDelegate: SceneDelegate?
    @State var player: Player
    
    var body: some View {
        
        ZStack {
            Image("BgMenu")
                .resizable()
            
            VStack {
                
                Image(uiImage: UIImage(data: player.photo.image) ?? UIImage(named: "Group3")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(
                        minWidth: 150,
                        idealWidth: 200,
                        maxWidth: 300,
                        minHeight: 150,
                        idealHeight: 200,
                        maxHeight: 300,
                        alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top)
                
                Spacer().frame(minWidth: 50, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 150, minHeight: 20, idealHeight: 40, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                ZStack {
                    
                    Text(player.displayName)
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    
                }.frame(minWidth: 80, idealWidth: 200, maxWidth: 400, minHeight: 20, idealHeight: 50, maxHeight: 70, alignment: .center)
                
                Spacer().frame(minWidth: 80, idealWidth: 150, maxWidth: 200, minHeight: 80, idealHeight: 200, maxHeight: 250, alignment: .center)
                
                Button(action: {gameCenterDelegate!.criarPartida()}, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                            .resizable()
                        
                        Text("Enter Room".localized())
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 25)
                    }
                })
                
                Button(action: {gameCenterDelegate!.criarPartida()}, label: {
                    ZStack(alignment: .center){
                        Image("BgButtonCreateRoom")
                            .resizable()
                        
                        
                        Text("Create Room".localized())
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 25)
                    }
                })
                
                
            }.padding()
        }
    }
}

//struct Menu_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
