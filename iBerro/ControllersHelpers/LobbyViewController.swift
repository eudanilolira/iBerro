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
    var lobbyView: UIHostingController<LobbyView>?
    var lobbyVM: LobbyViewModel?
    var isHost: Bool = false
    
    override init?(invite: GKInvite) {
        super.init(invite: invite)
        self.setupLobbyView()
    }

    override init?(matchRequest request: GKMatchRequest) {
        super.init(matchRequest: request)
        self.setupLobbyView()
        self.isHost = true
        self.matchRequest.recipientResponseHandler = { (player, response) in
            print("\(player.displayName) - \(response)")
        }
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
    
    func startMatch(musicGenre: String, highScore: String) {
        GameCenterHelper.helper.isHost = self.isHost
        
        if GameCenterHelper.helper.isHost {
            GameCenterHelper.helper.musicGenre = musicGenre
            GameCenterHelper.helper.highScore = Int(highScore)!
        }
        
        GKMatchmaker.shared().finishMatchmaking(for: GameCenterHelper.helper.match!)
        
        self.dismiss(animated: false, completion: {
            GameCenterHelper.helper.delegate?.presentGame(match:  GameCenterHelper.helper.match!)
        })
    }
    
    func leaveViewController() {
        lobbyView?.dismiss(animated: false, completion: {
            print("Teste")
        })
    }

    private func setupLobbyView() {
        self.lobbyVM = LobbyViewModel(matchRequest: self.matchRequest)
        
        if let viewModel = lobbyVM {
            lobbyView = UIHostingController(rootView: LobbyView(delegate: self, lobbyViewModel: viewModel))
        }
        
        self.addChild(lobbyView!)
        self.view.addSubview(lobbyView!.view)
        

        if let gameUIHosting = lobbyView {
            gameUIHosting.view.translatesAutoresizingMaskIntoConstraints = false
            gameUIHosting.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            gameUIHosting.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            gameUIHosting.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            gameUIHosting.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }
    }
}
