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
    var model = GameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.match?.delegate = self
        self.view.addSubview(button)
        
        let gameUIView = GameView(matchDelegate: self, game: model)
        gameView = UIHostingController(rootView: gameUIView)
        
        self.addChild(gameView!)
        self.view.addSubview(gameView!.view)
        self.setupConstraints()
    }
    
    func setupConstraints() {
        if let gameUIHosting = gameView {
            gameUIHosting.view.translatesAutoresizingMaskIntoConstraints = false
            gameUIHosting.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            gameUIHosting.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            gameUIHosting.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            gameUIHosting.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }

    }
    
    @objc func sendData() {
        self.model.model.time += 1
        guard let match = match else { return }
        
        do {
            guard let data = self.model.model.encode() else { return }
            try match.sendData(toAllPlayers: data, with: .reliable)
        } catch {
            print("Send data failed")
        }
    }
    
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        guard let model = GameModel.decode(data: data) else { return }
        self.model.model = model
    }
}
