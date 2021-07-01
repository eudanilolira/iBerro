//
//  GameCenterLoginViewController.swift
//  iBerro
//
//  Created by Danilo Araújo on 01/07/21.
//

import GameKit
import UIKit
import SwiftUI

class GameCenterLoginViewController: UIViewController, GameCenterHelperDelegate  {
    private var gameCenterHelper = GameCenterHelper.shared
    private var menu = UIHostingController(rootView: Menu())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameCenterHelper.delegate = self
        gameCenterHelper.authenticatePlayer()
    }
    
    func didChangeAuthStatus(isAuthenticated: Bool) {
        if isAuthenticated {
            self.addChild(menu)
            self.view.addSubview(menu.view)
            self.setupConstraints()
        } else {
            //TODO: MOSTRAR VIEW CASO O USUÁRIO NÃO QUEIRA ENTRAR NO GAMECENTER
            print("Não estou autenticado")
        }
    }
    
    func presentGameCenterAuth(viewController: UIViewController?) {
        guard let vc = viewController else {return}
        self.present(vc, animated: true)
    }
    
    func setupConstraints() {
        self.menu.view.translatesAutoresizingMaskIntoConstraints = false
        self.menu.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.menu.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.menu.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.menu.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
}
