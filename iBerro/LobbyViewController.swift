//
//  LobbyViewController.swift
//  iBerro
//
//  Created by Danilo Araújo on 14/07/21.
//

import Foundation
import GameKit

class LobbyViewController: GKMatchmakerViewController {
    
    override init?(invite: GKInvite) {
        super.init(invite: invite)
        print("Convite")
    }
    
    override init?(matchRequest request: GKMatchRequest) {
        super.init(matchRequest: request)
        print("Criei")
    }
        
        required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
}
