//
//  PlayingView.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 15/07/21.
//

import SwiftUI

struct PlayingView: View {
    var gameCenterDelegate: SceneDelegate?
    @State var player: Player
    //    var matchDelegate: GameViewController
    //    @ObservedObject var game: GameViewModel
    
    
    var body: some View {
        ZStack {
            Image("BgMenu")
                .resizable()
            VStack{
                HStack{
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
                            alignment: .top)
                        .padding()
                    
                    Text("\(player.displayName.uppercased())'s TURN".localized())
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Button(action: {print("sair")}, label: {
                        ZStack(alignment: .center){
                            Image("BgButtonCreateRoom")
                                .resizable()
                            
                            
                            Text("SKIP TURN".localized())
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 10)
                        }
                    }).frame(minWidth: 75, idealWidth: 155, maxWidth: 225, minHeight: 75, idealHeight: 125, maxHeight: 155, alignment: .center)
                    
                }.padding(20)
                
                Spacer()
                
                SoundVisualizer().frame(width: 250, height: 350, alignment: .center)
                
                Spacer()
                
                Button(action: {print("ligou mic")}, label: {
                    ZStack{
                        Image("BgButtonSignIn")
                            .resizable()
                        
                        Text("BELT OUT".localized())
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom, 25)
                        
                    }
                    
                }).disabled(true).saturation(/*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/).frame(minWidth: 130, idealWidth: 210, maxWidth: 260, minHeight: 130, idealHeight: 180, maxHeight: 210, alignment: .center)
                
                Spacer()
                
                HStack{
                    
                    //ForEach(self.matchDelegate.match!.players, id: \.self) { player in
                    ForEach(0...3, id: \.self) { player in
                        VStack{
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
                            
                            Text("NOME DE FULANO")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                        }
                    }.padding(.bottom, 35)
                }
            }
        }.ignoresSafeArea()
    }
}

//struct PlayingView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayingView()
//    }
//}
