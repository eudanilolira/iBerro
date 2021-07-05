//
//  GameCenterLoginView.swift
//  iBerro
//
//  Created by Danilo Araújo on 01/07/21.
//

import SwiftUI
import GameKit

struct GameCenterLogin: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<GameCenterLogin>) -> GameCenterLoginViewController {
        let viewController = GameCenterLoginViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: GameCenterLoginViewController, context: UIViewControllerRepresentableContext<GameCenterLogin>) {
    }
}



