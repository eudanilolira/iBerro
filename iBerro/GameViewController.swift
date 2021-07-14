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
    var match: GKMatch?
    var gameView: UIHostingController<GameView>?
    var button = UIButton()
    var model: GameViewModel?
    var voiceChat: GKVoiceChat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.match?.delegate = self
        self.view.addSubview(button)
        self.setupGameView()
        
        guard let players = setupPlayers() else { return } //LIDAR COM ERRO DE PARTIDA
        let room = Room(maxScore: 120) //PERMITIR ESCOLHA DE MAXSCORE
        model = GameViewModel(players: players, room: room)
        
        
        do {
            let audioSession = AVAudioSession.sharedInstance() //I can init it anywhere
            try audioSession.setActive(true, options: [])
            self.voiceChat = match?.voiceChat(withName: "Teste")
            
            voiceChat?.volume = 1
            voiceChat?.start()
            voiceChat?.isActive = true
            
            
            print("Esta ativo: \(voiceChat?.isActive)")
            
        } catch {
            return
        }
        self.setupGameView()
    }
    
    func match(_ match: GKMatch, shouldReinviteDisconnectedPlayer player: GKPlayer) -> Bool {
        print("Tentou convidar player desconectado")
        return true
    }
    
    private func setupPlayers() -> [Player]?{
        guard let gCPlayers = self.match?.players else { return nil }
        var players: [Player] = []
        
        for gCPlayer in gCPlayers {
            gCPlayer.loadPhoto(for: .normal, withCompletionHandler: { (image, erro) in
                if let photo = image {
                    let player = Player(displayName: gCPlayer.displayName, isHost: false, photo: ImageWrapper(photo: photo))
                    players.append(player)
                }
            })
        }
        
        return players
    }
    
    private func setupGameView() {
        guard let gameModel = model else {return }
        
        let gameUIView = GameView(matchDelegate: self, game: gameModel)
        gameView = UIHostingController(rootView: gameUIView)
        
        self.addChild(gameView!)
        self.view.addSubview(gameView!.view)
        
        if let gameUIHosting = gameView {
            gameUIHosting.view.translatesAutoresizingMaskIntoConstraints = false
            gameUIHosting.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            gameUIHosting.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            gameUIHosting.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            gameUIHosting.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }

    }
    
    @objc func sendData() {
        guard let match = match else { return }

        do {
            guard let data = self.model!.model.encode() else { return }
            try match.sendData(toAllPlayers: data, with: .reliable)
        } catch {
            print("Send data failed")
        }
    }
    
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        self.match = match
        guard let model = GameModel.decode(data: data) else { return }
        self.model!.model = model
    }
}
