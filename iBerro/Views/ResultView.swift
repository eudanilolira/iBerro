//
//  ResultView.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 20/07/21.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var game: GameViewModel
    @Binding var currentScreen: String
    
    @State private var orientation = UIDeviceOrientation.unknown
    
    @Environment(\.horizontalSizeClass) var horizontalSize
    @Environment(\.verticalSizeClass) var verticalSize
    
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
                                .font(Font.custom("Pexico", size: 30))
                                .foregroundColor(.white)
                                .padding(.bottom, 10)
                        }
                    }).frame(minWidth: 75, idealWidth: 175, maxWidth: 225, minHeight: 120, idealHeight: 130, maxHeight: 140, alignment: .center)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 5) {
                        
                        Text(Date(), style: .time)
                            .font(Font.custom("Pexico", size: 20))
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                        
                        Text(Date(), style: .date)
                            .font(Font.custom("Pexico", size: 20))
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                    }
                    .padding()
                } .padding(.top)
                Spacer()
                
                ResultWinnerView(player: game.ranking[0])
                    .padding()
                
                HStack{
                    //ForEach(self.matchDelegate.match!.players, id: \.self) { player in
                    ForEach(1...game.ranking.count-1, id: \.self) { index in
                        VStack{
                            
                            Text("\(index+1)°")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            
                            Image(uiImage: UIImage(data: game.ranking[index].photo.image)! )
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
                            
                            Text(game.ranking[index].displayName)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                        }
                        
                    }.padding(.horizontal)
                    
                }
                
                Spacer(minLength: 50)

                Button(action: {
                    //Ir pra próxima tela (votação)
                    print("Compartilhou")
                }, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                            .resizable()
                        
                        Text("SHARE".localized())
                            .font(Font.custom("Pexico", size: 30))
                            .foregroundColor(.white)
                            .padding(.bottom)
                    }
                })
                .frame(minWidth: 150, idealWidth: 220, maxWidth: 300, minHeight: 120, idealHeight: 130, maxHeight: 140, alignment: .center)
                Spacer()
            }
        }
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
