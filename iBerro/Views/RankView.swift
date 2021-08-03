//
//  RankView.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 19/07/21.
//

import SwiftUI

struct RankView: View {
    @ObservedObject var game: GameViewModel
    @Binding var currentScreen: String
    
    var body: some View {
        ZStack {
            Image("BgMenu")
                .resizable()
            VStack{
                HStack{
                    
                    Text("RANKING".localized())
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Spacer()
                    
                    //Colocar o número da rodada e fazer a internacionalização
                    Text("3th Turn")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                }
                .padding(.horizontal, 45)
                .padding(.vertical, 5.0)
                
                ForEach(0...3, id: \.self) { index in
                    HStack{
                        Image("Group 3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(
                                minWidth: 50,
                                idealWidth: 100,
                                maxWidth: 200,
                                minHeight: 50,
                                idealHeight: 100,
                                maxHeight: 200,
                                alignment: .top)
                        VStack{
                            
                            Text("NOME DE FULANO")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading).frame(width: 200, height: 30, alignment: .leading)
                            
                            Text("60 Pts")
                                .font(.system(size: 18))
                                .foregroundColor(.pink)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading).frame(width: 200, height: 30, alignment: .leading)
                            
                        }
                        
                        Spacer()
                        
                        Text("\(index + 1)º")
                            .font(.system(size: 35))
                            .foregroundColor(.green)
                            
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading).frame(width: 40, height: 30, alignment: .trailing).padding()
                        
                    }
                }.padding(.bottom, 30)
                
                Spacer()
                
                Button(action: {print("Está pronto")}, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                            .resizable()
                        
                        Text("READY".localized())
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 25)
                        
                    }
                    
                }).frame(minWidth: 130, idealWidth: 210, maxWidth: 260, minHeight: 130, idealHeight: 180, maxHeight: 210, alignment: .center)
                
            }.padding()
            .padding(.top)
        }.ignoresSafeArea()
    }
}

struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
