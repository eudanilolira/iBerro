//
//  ResultView.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 20/07/21.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        ZStack {
            Image("BgResultado")
                .resizable()
            
            VStack {
                
                HStack{
                    Button(action: {print("sair")}, label: {
                        ZStack(alignment: .center){
                            Image("BgButtonCreateRoom")
                                .resizable()
                            
                            
                            Text("LEAVE".localized())
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 10)
                        }
                    }).frame(minWidth: 75, idealWidth: 155, maxWidth: 225, minHeight: 75, idealHeight: 125, maxHeight: 155, alignment: .center)
                    
                    Spacer()
                    
                    VStack{
                    Text("11:47 PM")
                        .font(.system(size: 20))
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        
                        Text("JUN 9 2021")
                            .font(.system(size: 20))
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                    }
                    
                }.padding(20)
                
                Image("BgPrimeiroLugar")
                    .scaledToFit()
                
                HStack{
                    
                    //ForEach(self.matchDelegate.match!.players, id: \.self) { player in
                    ForEach(0...3, id: \.self) { index in
                        VStack{
                            
                            Text("\(index+2)°")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            
                            Image("Group 3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(
                                    minWidth: 50,
                                    idealWidth: 60,
                                    maxWidth: 100,
                                    minHeight: 50,
                                    idealHeight: 60,
                                    maxHeight: 100,
                                    alignment: .top)
                            
                            Text("NOME DE FULANO")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                        }
                    }.padding(.horizontal)
                }.padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    //Ir pra próxima tela (votação)
                    print("Compartilhou")
                }, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                            .resizable()
                        
                        Text("SHARE".localized())
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 25)
                    }
                })
                .frame(minWidth: 130, idealWidth: 210, maxWidth: 260, minHeight: 130, idealHeight: 180, maxHeight: 210, alignment: .center).padding(.bottom)
                
            }
        }.ignoresSafeArea()
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
