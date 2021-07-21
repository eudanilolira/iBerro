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
                    
                }.padding(20)
                ZStack{
                Image("BgPrimeiroLugar")
                    .scaledToFit()
                    VStack{
                        Image(uiImage: UIImage(data: player.photo.image) ?? UIImage(named: "Group 3")!)
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
                                alignment: .center)
                            .padding()
                        
                        Text(player.displayName.uppercased())
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding()
                    }
                }
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
                .frame(minWidth: 150, idealWidth: 250, maxWidth: 300, minHeight: 130, idealHeight: 180, maxHeight: 210, alignment: .center).padding(.bottom)
                
            }
        }.ignoresSafeArea()
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
