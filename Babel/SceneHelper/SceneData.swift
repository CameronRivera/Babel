//
//  SceneData.swift
//  Babel
//
//  Created by Cameron Rivera on 1/7/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation
import SpriteKit

class SceneData{
    static let shared = SceneData()
    
    // Question Scene Data
    var upperText = ""
    
    // GameScene Data
    var isFirstTimeLoading = true
    var selectedGhost = ""
    var phase = 0
    
    // Shared Data
    var selectedCorrectly = false
    var usersChoice: DetectedLanguage?
    
    private init(){
        
    }
}
