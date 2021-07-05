//
//  GameCenterHelper.swift
//  iBerro
//
//  Created by Danilo Araújo on 01/07/21.
//

import Foundation
import GameKit

protocol GameCenterHelperDelegate: AnyObject {
    func didChangeAuthStatus(isAuthenticated: Bool)
    func presentGameCenterAuth(viewController: UIViewController?)
}

final class GameCenterHelper: NSObject, GKLocalPlayerListener {
    
    static let shared = GameCenterHelper()
    weak var delegate: GameCenterHelperDelegate?
    private var currentVC: GKMatchmakerViewController?
    
    var isAuthenticated: Bool {
        return GKLocalPlayer.local.isAuthenticated
    }
    
    func authenticatePlayer() {
        GKLocalPlayer.local.authenticateHandler = { (gcAuthVC, error) in
            self.delegate?.didChangeAuthStatus(isAuthenticated: self.isAuthenticated)
            
            guard GKLocalPlayer.local.isAuthenticated else {
                self.delegate?.presentGameCenterAuth(viewController: gcAuthVC)
                return
            }

            GKLocalPlayer.local.register(self)
        }
    }
}
