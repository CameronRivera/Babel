//
//  SpriteViewController.swift
//  Babel
//
//  Created by Cameron Rivera on 1/2/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit
import SpriteKit

class SpriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        let scene = GameScene(size: view.bounds.size)
        guard let skView = view as? SKView else {
            return
        }
        scene.name = "Game Scene"
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
}
