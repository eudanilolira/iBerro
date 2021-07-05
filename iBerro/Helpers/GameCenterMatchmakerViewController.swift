//
//  GameCenterMatchmakerViewController.swift
//  iBerro
//
//  Created by Danilo Araújo on 05/07/21.
//

import Foundation
import UIKit
import GameKit

class GameCenterMatchmakerViewController: UIViewController, GameCenterMatchmakerHelperDelegate {
    private var gameCenterHelper = GameCenterMatchmakerHelper.shared
    var viewInterface: GameCenterMatchmakerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameCenterHelper.delegate = self
        gameCenterHelper.presentMatchmaker()
    }
    
    func presentMatchmaking(viewController: UIViewController?) {
        guard let vc = viewController else {return}
        self.present(vc, animated: true)
    }
    
    func presentGame(match: GKMatch) {
        print("Começar jogo")
    }
    
    func dismissMatchmaking() {
        self.viewInterface?.closeRoom()
    }
}
