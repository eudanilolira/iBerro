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
        GKMatchmaker.shared().findMatch(for: self.matchRequest, withCompletionHandler: { (match, error) in
            GameCenterHelper.helper.match = match
            //TRATAR ERROS DE CRIAÁCÃO DE PARTIDA
        })
    }
    
    func startMatch() {
        GKMatchmaker.shared().finishMatchmaking(for: GameCenterHelper.helper.match!)
        
        self.dismiss(animated: false, completion: {
            GameCenterHelper.helper.delegate?.presentGame(match:  GameCenterHelper.helper.match!)
        })
    }
    
    private func setupGameView() {
        let lobbyViewModel = LobbyViewModel(matchRequest: self.matchRequest)
        
        gameView = UIHostingController(rootView: LobbyView(delegate: self, lobbyViewModel: lobbyViewModel))

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
