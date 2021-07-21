//
//  LobbyViewController.swift
//  iBerro
//
//  Created by Danilo Araújo on 14/07/21.
//

import Foundation
import GameKit
import SwiftUI

class LobbyViewController: GKMatchmakerViewController {
    var gameView: UIHostingController<LobbyView>?
    var players: [Player] = []
    
    override init?(invite: GKInvite) {
        super.init(invite: invite)
        self.setupGameView()
    }

    override init?(matchRequest request: GKMatchRequest) {
        super.init(matchRequest: request)
        self.setupGameView()
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createMatch() {
    }
    
    private func setupGameView() {
        GKLocalPlayer.local.loadChallengableFriends(completionHandler: { (players, error) in
            self.matchRequest.recipients = players
            for player in players! {
                player.loadPhoto(for: .normal, withCompletionHandler: { image, error in
                    self.players.append(Player(displayName: player.displayName, isHost: false, photo: ImageWrapper (photo: image!)))
                })
            }
        })
        
        gameView = UIHostingController(rootView: LobbyView(delegate: self, players: self.players))

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
}
