//
//  TransitionManager.swift
//  Babel
//
//  Created by Cameron Rivera on 1/7/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation
import SpriteKit

enum Transition{
    case gameScene
    case questionScene
}

class TransitionManager{
    static let shared = TransitionManager()
    private init(){}
    
    func transition(_ fromScene: SKScene, _ toScene: Transition, _ size: CGSize, _ transition: SKTransition? = nil) {
        guard let scene = getScene(toScene, size) else {
            return
        }
        
        if let transition = transition {
            scene.scaleMode = .resizeFill
            scene.backgroundColor = SKColor.white
            fromScene.view?.presentScene(scene, transition: transition)
        } else {
            scene.scaleMode = .resizeFill
            scene.backgroundColor = SKColor.white
            fromScene.view?.presentScene(scene)
        }
    }
    
    func getScene(_ type: Transition, _ size: CGSize) -> SKScene?{
        switch type{
        case .gameScene:
            return GameScene(size: size)
        case .questionScene:
            return QuestionScene(size: size)
        }
    }
}
