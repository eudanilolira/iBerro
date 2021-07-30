//
//  GameViewController.swift
//  iBerroApp
//
//  Created by Danilo Araújo on 08/07/21.
//

import Foundation
import UIKit
import GameKit
import SwiftUI

class GameViewController: UIViewController, GKMatchDelegate {
    var match: GKMatch? {
        get {
            GameCenterHelper.helper.match
        }
    }
    
    var gameView: UIHostingController<PlayingView>?
    var button = UIButton()
    var gameViewModel: GameViewModel?
    var voiceChat: GKVoiceChat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.match?.delegate = self
        self.view.addSubview(button)
        
        do {
            let audioSession = AVAudioSession.sharedInstance() //I can init it anywhere
            try audioSession.setActive(true, options: [])
            self.voiceChat = match?.voiceChat(withName: "Teste")
            
            voiceChat?.volume = 1
            voiceChat?.start()
            voiceChat?.isActive = true
            
        } catch {
            return
        }
        
        if GameCenterHelper.helper.isHost {
            setupPlayers() { players in
                self.gameViewModel = GameViewModel(
                    players: players,
                    room: Room(
                        maxScore: GameCenterHelper.helper.highScore,
                        musicGenre: GameCenterHelper.helper.musicGenre
                    )
                )
                
                self.sendData()
                self.setupGameView()
            }
        }
    }
    
    func match(_ match: GKMatch, shouldReinviteDisconnectedPlayer player: GKPlayer) -> Bool {
        print("Tentou convidar player desconectado")
        return true
    }
        
    private func setupGameView() {
        guard let gameModel = gameViewModel else {return }
        
        let gameUIView = PlayingView(matchDelegate: self, game: gameModel)
        gameView = UIHostingController(rootView: gameUIView)
        
        self.addChild(gameView!)
        self.view.addSubview(gameView!.view)
        
        //Getting player ready for game
        let player = gameModel.model.localPlayer()
        gameModel.model.setPlayerStatus(name: player.displayName, status: .ready)
        self.sendData()
        
        if let gameUIHosting = gameView {
            gameUIHosting.view.translatesAutoresizingMaskIntoConstraints = false
            gameUIHosting.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            gameUIHosting.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            gameUIHosting.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            gameUIHosting.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }
    }
    
    func leaveGame() {
        self.dismiss(animated: true)
    }
    
    @objc func sendData() {
        guard let match = match else { return }

        do {
            guard let data = self.gameViewModel!.model.encode() else { return }
            try match.sendData(toAllPlayers: data, with: .reliable)
            
        } catch {
            print("Send data failed")
        }
    }
    
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        guard let model = GameModel.decode(data: data) else { return }
        
        //1 - HOST MANDANDO CONFIGURAÇÃO DA SALA PROS CONVIDADOS
        //2 - MUDANÇA DE ESTADO DO JOGADOR
        // - CANTANDO - ESPERANDO
        // - ASSISTINDO - VOTANDO - ESPERANDO
        // - ESPERANDO - PRONTO
        // - PRONTO PRA ASSISTINDO
        
        if self.gameViewModel == nil {
            self.gameViewModel = GameViewModel(players: model.players, room: model.room)
            self.setupGameView()
            
        } else {
            let senderIndex = gameViewModel!.model.playerIndex(from: player.displayName)
            self.gameViewModel!.model.players[senderIndex] = model.players[senderIndex]
        }
    }
}

//Host Functions
extension GameViewController {
    private func setupPlayers(completionHandler: @escaping ([Player]) -> Void){
        guard var gCPlayers = self.match?.players else { return }
        
        gCPlayers.append(GKLocalPlayer.local)
        
        var players: [Player] = []
        var loadedPlayers: Int = 0
        
        for gCPlayer in gCPlayers {
            
            gCPlayer.loadPhoto(for: .normal, withCompletionHandler: { (image, erro) in
                if let photo = image {
                    
                    let player = Player(
                        displayName: gCPlayer.displayName,
                        isHost: false,
                        photo: ImageWrapper(photo: photo)
                    )
                    
                    players.append(player)
                    loadedPlayers += 1

                    if loadedPlayers == gCPlayers.count {
                        for i in 0..<players.count {
                            players[i].status = i == 0 ? .ready: .waiting
                        }
                        
                        completionHandler(players)
                    }
                    
                }
            })
        }
    }
}
