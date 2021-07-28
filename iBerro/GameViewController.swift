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
    
    var players: [Player] = []
    var gameView: UIHostingController<PlayingView>?
    var button = UIButton()
    var model: GameViewModel?
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
        
        setupPlayers() { players in
            self.players = players
            print("VARIAEL PLAYER no setup: \(players)")
            print("OS players no setup: \(self.players)")
            self.model = GameViewModel(players: players, room: Room(maxScore: 120))
            self.setupGameView()
        }
    }
    
    func match(_ match: GKMatch, shouldReinviteDisconnectedPlayer player: GKPlayer) -> Bool {
        print("Tentou convidar player desconectado")
        return true
    }
    
    private func setupPlayers(completionHandler: @escaping ([Player]) -> Void){
        guard var gCPlayers = self.match?.players else { return }
        
        gCPlayers.append(GKLocalPlayer.local)
        
        gCPlayers.sort(by: { firstPlayer, secondPlayer in
            firstPlayer.displayName < secondPlayer.displayName
        })
        
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
                            players[i].status = i == 0 ? .singing : .watching
                        }
                        
                        completionHandler(players)
                    }
                    
                }
            })
        }
        
        
    }
    
    private func setupGameView() {
        guard let gameModel = model else {return }
        
        let gameUIView = PlayingView(
            matchDelegate: self,
            game: gameModel,
            players: self.players
        )
        
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
    
    func leaveGame() {
        self.dismiss(animated: true)
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
        guard let model = GameModel.decode(data: data) else { return }
        self.model!.model = model
    }
}
