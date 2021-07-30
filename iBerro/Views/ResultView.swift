//
//  ResultView.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 20/07/21.
//

import SwiftUI

struct ResultView: View {
    var gameCenterDelegate: SceneDelegate?
    @State var player: Player
    @State private var orientation = UIDeviceOrientation.unknown
    
    
    var body: some View {
        ZStack {
            Image("BgResultado")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                HStack{
                    Button(action: {print("sair")}, label: {
                        ZStack(alignment: .center){
                            Image("BgButtonLeave")
                                .resizable()
                            
                            
                            Text("LEAVE".localized())
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom)
                        }
                    }).frame(minWidth: 75, idealWidth: 175, maxWidth: 225, minHeight: 80, idealHeight: 100, maxHeight: 140, alignment: .center)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 5) {
                        
                        Text(Date(), style: .time)
                            .font(.system(size: 20))
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                        
                        Text(Date(), style: .date)
                            .font(.system(size: 20))
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                    }
                    
                }
                .padding()
                Spacer()
                
                ResultWinnerView(player: player)
                
                Spacer(minLength: 120)
                
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
                }
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
                            .padding(.bottom)
                    }
                })
                .frame(minWidth: 150, idealWidth: 220, maxWidth: 300, minHeight: 80, idealHeight: 100, maxHeight: 140, alignment: .center)
                
            }
        }
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
