//
//  GameCenterMatchmakerHelper.swift
//  iBerro
//
//  Created by Danilo Araújo on 05/07/21.
//

import GameKit

protocol GameCenterMatchmakerHelperDelegate: AnyObject {
    func presentMatchmaking(viewController: UIViewController?)
    func presentGame(match: GKMatch)
    func dismissMatchmaking()
}

final class GameCenterMatchmakerHelper: NSObject, GKLocalPlayerListener, GKMatchmakerViewControllerDelegate {

    static let shared = GameCenterMatchmakerHelper()
    private var currentVC: GKMatchmakerViewController?
    weak var delegate: GameCenterMatchmakerHelperDelegate?
    
    func presentMatchmaker(withInvite invite: GKInvite? = nil) {
        guard GKLocalPlayer.local.isAuthenticated,
              let vc = createMatchmaker(withInvite: invite) else { return }
        
        currentVC = vc
        vc.matchmakerDelegate = self
        delegate?.presentMatchmaking(viewController: vc)
    }
    
    private func createMatchmaker(withInvite invite: GKInvite? = nil) -> GKMatchmakerViewController? {
        if let invite = invite {
            return GKMatchmakerViewController(invite: invite)
        }
        
        return GKMatchmakerViewController(matchRequest: createRequest())
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        viewController.dismiss(animated: true)
        delegate?.presentGame(match: match)
    }
    
    func player(_ player: GKPlayer, didAccept invite: GKInvite) {
        currentVC?.dismiss(animated: true, completion: {
            self.presentMatchmaker(withInvite: invite)
        })
    }
    
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        delegate?.dismissMatchmaking()
        currentVC?.dismiss(animated: true)
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        print("Matchmaker vc did fail with error: \(error.localizedDescription).")
    }
    
    private func createRequest() -> GKMatchRequest {
        let request = GKMatchRequest()
        request.minPlayers = 1
        request.maxPlayers = 5
        request.inviteMessage = "Hey Kanti. Let's sing together?"
        
        return request
    }
}
