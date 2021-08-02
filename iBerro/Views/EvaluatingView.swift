//
//  EvaluatingView.swift
//  iBerro
//
//  Created by Meyrillan Silva on 19/07/21.
//

import Foundation
import SwiftUI

struct EvaluatingView: View {
    
    var gameCenterDelegate: SceneDelegate?
    
    @State var player: Player
    @State var players: [Player]
    
    @State private var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(player: Player) {
        self.player = player
        
        // players fake pra testar o grid!
        players = [player,player,player,player,player,player]
    }
    
    var body: some View {
        
        ZStack{
            
            Image("BgMenu")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                if timeRemaining > 0 {
                    
                    Text("\(timeRemaining)")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 60)
                        
                    
                } else {
                    // Aqui vai entrar a navegação, e o voto do jogador não foi computado
                }
                
                Text("2/5 votaram")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom)
                
                PlayersView(players: $players)
                    .frame(minWidth: 300, idealWidth: 450, maxWidth: 600, minHeight: 300, idealHeight: 400, maxHeight: 450, alignment: .center)
                    .padding()
                
                // trocar para o display.name do jogador da vez
                Text("Eae, \("Cláudia A+ Top") cantou certo?")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .frame(width: 450, height: 200, alignment: .bottom)

                
                HStack {
                    Button(action: {
                        //Ir pra próxima tela (ranking)
                        print("Votou")
                    }, label: {
                        ZStack{
                            Image("BgButtonWrong")
                                .resizable()
                            
                            Text("WRONG".localized())
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 25)
                        }
                    })
                    
                    
                    Button(action: {
                        //Ir pra próxima tela (ranking)
                        print("Votou")
                    }, label: {
                        ZStack{
                            Image("BgButtonRight")
                                .resizable()
                            
                            Text("RIGHT".localized())
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 25)
                        }
                    })
                } .frame(minWidth: 300, idealWidth: 450, maxWidth: 600, minHeight: 100, idealHeight: 130, maxHeight: 150, alignment: .center)
                Spacer(minLength: 20)
                
            }
            
        }
    }
}
