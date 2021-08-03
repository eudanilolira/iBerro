//
//  RankView.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 19/07/21.
//

import SwiftUI

struct RankView: View {
    
    var delegate: GameViewController?
    var ranking: [Player]
    
    @ObservedObject var game: GameViewModel
    @Binding var currentScreen: String
    @State var singingIndex: Int = 0
    @Environment(\.presentationMode) var presentation
    
    init(game: GameViewModel, currentScreen: Binding<String>, delegate: GameViewController) {
        self.game = game
        self._currentScreen = currentScreen
        self.delegate = delegate
        self.ranking = game.model.ranking()
        self.delegate!.voiceChat!.isActive = true
    }
    
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
                
                ForEach(ranking) { player in
                    HStack{
                        Image(uiImage: UIImage(data: player.photo.image)!)
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
                            
                            Text(player.displayName)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading).frame(width: 200, height: 30, alignment: .leading)
                            
                            Text("\(player.score) pts")
                                .font(.system(size: 18))
                                .foregroundColor(.pink)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading).frame(width: 200, height: 30, alignment: .leading)
                            
                        }
                        
                        Spacer()
                        
                        Text("\(ranking.firstIndex(of: player)! + 1)º")
                            .font(.system(size: 35))
                            .foregroundColor(.green)
                            
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading).frame(width: 40, height: 30, alignment: .trailing).padding()
                        
                    }
                }.padding(.bottom, 30)
                
                Spacer()
                
                Button(action: {
                    setSingIndex()
                    let playerIndex = game.model.players.firstIndex(of: game.model.localPlayer())!
                    game.model.players[playerIndex].status = .waiting
                    delegate!.sendData()
                }, label: {
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
        
        .onChange(of: game.model.players.filter({ player in
            player.status == .waiting
        }), perform: { waitingPlayers in
            if waitingPlayers.count == game.model.players.count {
                if waitingPlayers[singingIndex] == game.model.localPlayer() {
                    game.model.players[singingIndex].status = .singing
                } else {
                    let index = game.model.players.firstIndex(of: game.model.localPlayer())!
                    game.model.players[index].status = .watching
                }
                
                delegate!.sendData()
                currentScreen = "playing"
                presentation.wrappedValue.dismiss()
            }
        })
    }
    
    func setSingIndex() {
        let singingPlayer = game.model.players.first(where: {
            player in player.status == .singing
        })!
        singingIndex = game.model.players.firstIndex(of: singingPlayer)!
        
        if singingIndex == game.model.players.count - 1 {
            singingIndex = 0
        } else {
            singingIndex += 1
        }
    }
}
