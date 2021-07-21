//
//  LobbyVIew.swift
//  iBerro
//
//  Created by Danilo Araújo on 15/07/21.
//

import SwiftUI
import GameKit

struct LobbyView: View {
    
    var delegate: LobbyViewController
   @State var players: [Player] = []
    var body: some View {
        
        ZStack{
            Image("Background2")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Button(action: {delegate.createMatch()}, label: {
                        ZStack{
                            Image("BgButtonSignOut")
                                .resizable()
                            Text("Sair")
                        }
                    })
                    
                    Spacer()
                }
                ZStack{
                    Image("BgSelectionBox")
                        .resizable()
                    
                    VStack{
                        Text("Gêneros musicais")
                        HStack{
                            ForEach(0..<3, content: { index in
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    HStack{
                                        Image("BgCheckbox")
                                            .resizable()
                                        Text("Forró")
                                    }
                                })
                            })
                        }
                        
                        Text("Pontuação máxima")
                        HStack{
                            ForEach(0..<4, content: { index in
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    HStack{
                                        Image("BgCheckbox")
                                            .resizable()
                                        Text("100")
                                    }
                                })
                            })
                        }
                        
                    }
                }
                
                UIGrid(columns: 3, list: players) { player in
                    VStack{
                        Image("Group 3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(
                                minWidth: 50,
                                idealWidth: 100,
                                maxWidth: 150,
                                minHeight: 50,
                                idealHeight: 100,
                                maxHeight: 150,
                                alignment: .bottom)
                        
                        Text("Joaozin".localized())
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .padding([.leading,.trailing])
                    }
                }
                
            }
        }
        
    }
}

//struct LobbyVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        LobbyView()
//    }
//}
