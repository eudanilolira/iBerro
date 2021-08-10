//
//  Menu.swift
//  iBerro
//
//  Created by Danilo Araújo on 01/07/21.
//
import SwiftUI
import GameKit

struct MenuView: View {
    
    @Environment(\.verticalSizeClass) var verticalSize
    
    var gameCenterDelegate: SceneDelegate?
    @State var player: Player
    
    var body: some View {
        
        ZStack {
            Image("BgMenu")
                .resizable()
            
            VStack {
                
                    Image(uiImage: UIImage(data: player.photo.image) ?? UIImage(named: "Group 3")!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(
                            minWidth: 100,
                            idealWidth: 200,
                            maxWidth: 250,
                            minHeight: 100,
                            idealHeight: 200,
                            maxHeight: 250,
                            alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.top, 80)
                    
                ZStack {
                    
                    Text(player.displayName)
                        .font(Font.custom("Pexico", size: 36))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    
                }.frame(minWidth: 80, idealWidth: 200, maxWidth: 400, minHeight: 20, idealHeight: 50, maxHeight: 70, alignment: .center)
                
                Spacer()
                                        
                    Button(action: {gameCenterDelegate!.criarPartida()}, label: {
                        ZStack(alignment: .center){
                            Image("BgButtonCreateRoom")
                                .resizable()
                                .frame(minWidth: 100, idealWidth: 350, maxWidth: 450, minHeight: 100, idealHeight: 140, maxHeight: 180, alignment: .center)
                            
                            Text("Create Room".localized())
                                .font(Font.custom("Pexico", size: 36))
                                .foregroundColor(.white)
                                .padding(.bottom, 25)
                        }
                    })
                    
                
                
            }.padding()
        }.ignoresSafeArea()
    }
}

//struct Menu_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
