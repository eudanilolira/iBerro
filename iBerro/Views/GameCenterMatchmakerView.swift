//
//  GameCenterMacthmakerView.swift
//  iBerro
//
//  Created by Danilo Araújo on 05/07/21.
//

import Foundation
import SwiftUI
import GameKit

struct GameCenterMatchmakerView: UIViewControllerRepresentable {
    @Binding var showRoom: Bool

    func makeUIViewController(context: UIViewControllerRepresentableContext<GameCenterMatchmakerView>) -> GameCenterMatchmakerViewController {
        let viewController = GameCenterMatchmakerViewController()
        viewController.viewInterface = self
        return viewController
    }

    func updateUIViewController(_ uiViewController: GameCenterMatchmakerViewController, context: UIViewControllerRepresentableContext<GameCenterMatchmakerView>) {
    }
    
    mutating func closeRoom() {
        self.showRoom.toggle()
    }
}
