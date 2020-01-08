//
//  GameScene.swift
//  Babel
//
//  Created by Cameron Rivera on 1/5/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit
import SpriteKit

// TODO: Find Hellfire and possibly clouds.
class GameScene: SKScene{
    
    var upperTextBox: SKShapeNode?
    var upperText: SKLabelNode?
    var enmaName: SKLabelNode?
    var soulName: SKLabelNode?
    var lowerTextBox: SKShapeNode?
    var lowerText: SKLabelNode?
    var progressButton: SKLabelNode?
    var progressButtonBox: SKShapeNode?
    var ghost: SKSpriteNode?
    var heavenButton: SKLabelNode?
    var heavenButtonBox: SKShapeNode?
    var hellButton: SKLabelNode?
    var hellButtonBox: SKShapeNode?
    var leftAngel: SKSpriteNode?
    var rightAngel: SKSpriteNode?
    var happyCloud: SKSpriteNode?
    var hellFire: SKSpriteNode?
    var rightDevil: SKSpriteNode?
    var leftDevil: SKSpriteNode?
    
    // MARK: DidMove
    override func didMove(to view: SKView){
        self.backgroundColor = SKColor.white
        if SceneData.shared.isFirstTimeLoading{
            initialSetUp()
            SceneData.shared.isFirstTimeLoading = false
        } else {
            returnFromQuestionSceneSetUp()
        }
    }
    
    // MARK: Create Top Label
    private func createLabel(_ displayText: String){
        upperText = SKLabelNode(text: displayText)
        upperText?.position = CGPoint(x: size.width * 0.05 ,y: size.height * 0.8)
        upperText?.fontColor = SKColor.white
        upperText?.preferredMaxLayoutWidth = size.width * 0.9
        upperText?.lineBreakMode = .byCharWrapping
        upperText?.zPosition = 2.0
        upperText?.fontSize = 25.0
        upperText?.horizontalAlignmentMode = .left
        upperText?.verticalAlignmentMode = .center
        upperText?.numberOfLines = 0
        upperText?.name = "Top Text"
        addChild(upperText!)
    }
    
    // MARK: Adds Name to top TextBox
    private func addEnma(_ displayText: String){
        enmaName = SKLabelNode(text: displayText)
        enmaName?.position = CGPoint(x: size.width * 0.05 ,y: size.height * 0.89)
        enmaName?.fontColor = SKColor.white
        enmaName?.preferredMaxLayoutWidth = size.width * 0.95
        enmaName?.lineBreakMode = .byCharWrapping
        enmaName?.zPosition = 2.0
        enmaName?.fontSize = 20.0
        enmaName?.horizontalAlignmentMode = .left
        enmaName?.verticalAlignmentMode = .top
        enmaName?.numberOfLines = 0
        enmaName?.name = "Top Text"
        addChild(enmaName!)
    }
    
    // MARK: Adds Name to Bottom TextBox
    private func addSoul(_ displayText: String){
        soulName = SKLabelNode(text: displayText)
        soulName?.position = CGPoint(x: size.width * 0.05 ,y: size.height * 0.29)
        soulName?.fontColor = SKColor.white
        soulName?.preferredMaxLayoutWidth = size.width * 0.95
        soulName?.lineBreakMode = .byCharWrapping
        soulName?.zPosition = 2.0
        soulName?.fontSize = 20.0
        soulName?.horizontalAlignmentMode = .left
        soulName?.verticalAlignmentMode = .top
        soulName?.numberOfLines = 0
        soulName?.name = "Top Text"
        addChild(soulName!)
    }
    
    // MARK: Create Lower Label
    private func createLowerLabel(_ displayText: String){
        lowerText = SKLabelNode(text: displayText)
        lowerText?.position = CGPoint(x: size.width * 0.05, y: size.height * 0.2)
        lowerText?.fontColor = SKColor.white
        lowerText?.preferredMaxLayoutWidth = size.width * 0.9
        lowerText?.lineBreakMode = .byCharWrapping
        lowerText?.zPosition = 2.0
        lowerText?.fontSize = 25.0
        lowerText?.horizontalAlignmentMode = .left
        lowerText?.verticalAlignmentMode = .center
        lowerText?.numberOfLines = 0
        lowerText?.name = "Lower Text"
        addChild(lowerText!)
    }
    
    // MARK: Create Upper Textbox
    private func createUpperTextbox(){
        upperTextBox = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0.0, y: size.height * 0.7), size: CGSize(width: size.width, height: size.height * 0.2)))
        upperTextBox?.fillColor = SKColor.black
        upperTextBox?.zPosition = 1.0
        upperTextBox?.lineWidth = 2.0
        upperTextBox?.alpha = 0.9
        upperTextBox?.strokeColor = SKColor.white
        upperTextBox?.name = "Upper Textbox"
        addChild(upperTextBox!)
    }
    
    // MARK: Create Lower Textbox
    private func createLowerTextbox(){
        lowerTextBox = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0.0, y: size.height * 0.094), size: CGSize(width: size.width, height: size.height * 0.2)))
        lowerTextBox?.fillColor = SKColor.black
        lowerTextBox?.zPosition = 1.0
        lowerTextBox?.lineWidth = 2.0
        lowerTextBox?.strokeColor = SKColor.white
        lowerTextBox?.alpha = 0.9
        lowerTextBox?.name = "Lower Textbox"
        addChild(lowerTextBox!)
    }
    
    // MARK: Create Button Box
    // Creates a box to place around the next button. Aids in the detection of tap location.
    private func createButtonBox(){
        progressButtonBox = SKShapeNode(rect: CGRect(origin: CGPoint(x: size.width * 0.89 ,y: size.height * 0.702), size: CGSize(width: size.width * 0.099, height: size.height * 0.02)))
        progressButtonBox?.name = "Button Box"
        progressButtonBox?.zPosition = 1.0
        progressButtonBox?.lineWidth = 2.0
        progressButtonBox?.alpha = 1.0
        progressButtonBox?.strokeColor = SKColor.black
        progressButtonBox?.isHidden = true
        addChild(progressButtonBox!)
    }
    
    // MARK: Creates a Button
    // Creates a Label that will have the function of a button.
    private func addButton(){
        progressButton = SKLabelNode(text: "Next")
        progressButton?.position = CGPoint(x: size.width * 0.9 , y: size.height * 0.702 )
        progressButton?.zPosition = 3.0
        progressButton?.fontColor = SKColor.white
        progressButton?.fontSize = 15.0
        progressButton?.horizontalAlignmentMode = .left
        progressButton?.verticalAlignmentMode = .bottom
        progressButton?.name = "Top Skip Button"
        addChild(progressButton!)
    }
    
    // MARK: Creates Heaven Buttton Box
    private func addHeavenBox(){
        heavenButtonBox = SKShapeNode(rect: CGRect(origin: CGPoint(x: size.width * 0.36 ,y: size.height * 0.64), size: CGSize(width: size.width * 0.3, height: size.height * 0.06)))
        heavenButtonBox?.zPosition = 1.0
        heavenButtonBox?.lineWidth = 2.0
        heavenButtonBox?.alpha = 1.0
        heavenButtonBox?.strokeColor = SKColor.black
        heavenButtonBox?.fillColor = SKColor.white
        heavenButtonBox?.isHidden = false
        addChild(heavenButtonBox!)
    }
    
    // MARK: Create Heaven Text
    private func createHeavenText(){
        heavenButton = SKLabelNode(text: "Heaven")
        heavenButton?.position = CGPoint(x: size.width * 0.4 ,y: size.height * 0.67)
        heavenButton?.fontColor = SKColor.black
        heavenButton?.preferredMaxLayoutWidth = size.width * 0.3
        heavenButton?.lineBreakMode = .byCharWrapping
        heavenButton?.zPosition = 2.0
        heavenButton?.fontSize = 25.0
        heavenButton?.horizontalAlignmentMode = .left
        heavenButton?.verticalAlignmentMode = .center
        heavenButton?.numberOfLines = 0
        addChild(heavenButton!)
    }
    
    // MARK: Creates Hell Buttton Box
    private func addHellBox(){
        hellButtonBox = SKShapeNode(rect: CGRect(origin: CGPoint(x: size.width * 0.36 ,y: size.height * 0.296), size: CGSize(width: size.width * 0.3, height: size.height * 0.06)))
        hellButtonBox?.zPosition = 1.0
        hellButtonBox?.lineWidth = 2.0
        hellButtonBox?.alpha = 1.0
        hellButtonBox?.strokeColor = SKColor.white
        hellButtonBox?.fillColor = SKColor.black
        hellButtonBox?.isHidden = false
        addChild(hellButtonBox!)
    }
    
    // MARK: Create Hell Text
    private func createHellText(){
        hellButton = SKLabelNode(text: "Hell")
        hellButton?.position = CGPoint(x: size.width * 0.4 ,y: size.height * 0.326)
        hellButton?.fontColor = SKColor.white
        hellButton?.preferredMaxLayoutWidth = size.width * 0.3
        hellButton?.lineBreakMode = .byCharWrapping
        hellButton?.zPosition = 2.0
        hellButton?.fontSize = 25.0
        hellButton?.horizontalAlignmentMode = .left
        hellButton?.verticalAlignmentMode = .center
        hellButton?.numberOfLines = 0
        addChild(hellButton!)
    }
    
    // MARK: Detects location of Touches
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        for touch in touches{
            if let progress = progressButtonBox{
                let location = touch.location(in: progress)
                if progress.contains(location) && SceneData.shared.phase == 1{
                    SceneData.shared.phase = 3
                    transition()
                } else if progress.contains(location) && SceneData.shared.phase == 0 {
                    SceneData.shared.phase = 2
                    spawnSoul()
                    upperText?.removeFromParent()
                    addSoul("Soul")
                    createLowerLabel(LanguageData.shared.queryString)
                } else if progress.contains(location) && SceneData.shared.phase == 2 {
                    SceneData.shared.phase = 1
                    createLabel("Oh right, they still maintain their native language until they move on. Let's see, this one seems to be speaking...")
                } else if progress.contains(location) && SceneData.shared.phase == 3 {
                    SceneData.shared.phase = 0
                    self.removeAllChildren()
                    self.initialSetUp()
                }
            }
            
            if let heaven = heavenButtonBox{
                let heavenLocation = touch.location(in: heaven)
                if heaven.contains(heavenLocation){
                    heavenOrHellMove("Heaven")
                }
            }
            
            if let hell = hellButtonBox{
                let hellLocation = touch.location(in: hell)
                if hell.contains(hellLocation){
                    heavenOrHellMove("Hell")
                }
            }
        }
    }
    
    // MARK: Spawns a Soul
    private func spawnSoul(){
        let ghostString = Ghost.names.randomElement() ?? "RedGhostForward"
        SceneData.shared.selectedGhost = ghostString
        
        ghost = SKSpriteNode(imageNamed: ghostString )
        ghost?.position = CGPoint(x: size.width + ghost!.size.width ,y: size.height * 0.5)
        ghost?.size = CGSize(width: 40.0, height: 40.0)
        addChild(ghost!)
        
        let move = SKAction.move(to: CGPoint(x: size.width * 0.5, y: size.height * 0.5), duration: 3.0)
        ghost?.run(move)
    }
    
    // MARK: Spawns a soul in the center
    private func spawnSoulCenter(){
        ghost = SKSpriteNode(imageNamed:SceneData.shared.selectedGhost)
        ghost?.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        ghost?.size = CGSize(width: 40.0, height: 40.0)
        addChild(ghost!)
    }
    
    // MARK: Heaven, Hell, or Limbo
    private func heavenOrHellMove(_ judgement: String){
        if judgement.lowercased() == "hell"{
            hellishDiplay()
            ghost?.run(SKAction.sequence([
                SKAction.move(to: CGPoint(x: size.width * 0.5 , y: size.height * -2.0), duration: 4.0),
                SKAction.playSoundFileNamed("pacman dead.wav", waitForCompletion: true)
                ]))
        } else if judgement.lowercased() == "heaven" {
            heavenDisplay()
            ghost?.run(SKAction.move(to: CGPoint(x: size.width * 0.5 , y: size.height * 2.0), duration: 4.0))
            ghost?.run(SKAction.playSoundFileNamed("HeavenlyChoirTrimmed.mp3", waitForCompletion: true))
        } else {
            let tempGhost = SKSpriteNode(imageNamed: ghostColour(SceneData.shared.selectedGhost))
            tempGhost.position = ghost!.position
            tempGhost.size = CGSize(width: 40.0, height: 40.0)
            ghost?.removeFromParent()
            ghost = tempGhost
            addChild(ghost!)
            ghost?.run(SKAction.move(to: CGPoint(x: size.width * 2, y: size.height * 0.5), duration: 3.0))
        }
    }
    
    // MARK: Performs a transition
    private func transition(){
        removeAllChildren()
        SceneData.shared.upperText = upperText?.text ?? " "
//        let reveal = SKTransition.reveal(with: .left, duration: 1.0)
        TransitionManager.shared.transition(self, .questionScene, size)
    }
    
    // MARK: Places Angels at the top of the screen
    private func heavenDisplay(){
        leftAngel = SKSpriteNode(imageNamed: "angel01")
        leftAngel?.position = CGPoint(x: size.width * 0.1, y: size.height * 0.94)
        leftAngel?.size = CGSize(width: 60.0, height: 60.0)
        rightAngel = SKSpriteNode(imageNamed: "angel02")
        rightAngel?.position = CGPoint(x: size.width * 0.9, y: size.height * 0.94)
        rightAngel?.size = CGSize(width: 60.0, height: 60.0)
//        happyCloud = SKSpriteNode(imageNamed: "happyCloudTrimmed")
//        happyCloud?.size = CGSize(width: 60.0, height: 60.0)
//        happyCloud?.position = CGPoint(x: size.width * 0.5, y: size.height * 0.94)
        
        addChild(leftAngel!)
        addChild(rightAngel!)
//        addChild(happyCloud!)
    }
    
    // MARK: Places HellFire on the bottom of the screen
    private func hellishDiplay(){
//        hellFire = SKSpriteNode(imageNamed: "firesOfHell")
//        hellFire?.position = CGPoint(x: size.width * 0.5, y: size.height * 0.05)
//        hellFire?.size = CGSize(width: size.width, height: 60.0)
//
//        addChild(hellFire!)
        leftDevil = SKSpriteNode(imageNamed: "devilBat")
        leftDevil?.position = CGPoint(x: size.width * 0.1, y: size.height * 0.05)
        leftDevil?.size = CGSize(width: 60.0, height: 60.0)
        rightDevil = SKSpriteNode(imageNamed: "devilBat")
        rightDevil?.position = CGPoint(x: size.width * 0.9, y: size.height * 0.05)
        rightDevil?.size = CGSize(width: 60.0, height: 60.0)
        addChild(leftDevil!)
        addChild(rightDevil!)
    }
    
    // MARK: Changes the text of a label
    private func changeLabelText(_ text: String, _ node: SKLabelNode){
        node.text = text
    }
    
    // MARK: Spawns a backward ghost
    private func ghostColour(_ ghostName: String) -> String {
        switch ghostName{
        case _ where ghostName.lowercased().contains("red"):
            return "RedGhostBackward"
        case _ where ghostName.lowercased().contains("blue"):
            return "BlueGhostBackward"
        case _ where ghostName.lowercased().contains("orange"):
            return "OrangeGhostBackward"
        case _ where ghostName.lowercased().contains("pink"):
            return "PinkGhostBackward"
        default:
            return ""
        }
    }
    
    // MARK: Initial Setup
    private func initialSetUp(){
        createLabel("Next!")
        createUpperTextbox()
        createLowerTextbox()
        addButton()
        createButtonBox()
        addEnma("Enma")
    }
    
    // MARK: Set up for return from question Scene
    private func returnFromQuestionSceneSetUp(){
//        LanguageData.shared.newQuery() FIND A BETTER PLACE FOR THIS
        createUpperTextbox()
        createLowerTextbox()
        addEnma("Enma")
        createButtonBox()
        addButton()
        guard let currentLanguage = SceneData.shared.usersChoice?.language else {
                return
        }
        let lang = LanguageData.shared.allLanguages.filter{currentLanguage == $0.code}
        
        if SceneData.shared.selectedCorrectly {
            
            createLabel("You speak to the soul in fluent \(lang.first!.name.lowercased()). It seems to understand you and awaits judgement.")
            spawnSoulCenter()
            DispatchQueue.global().async{
                LanguageData.shared.newQuery()
                self.upperText?.removeFromParent()
                self.createLabel("This one is ready for the after life. I think I'll send it...")
                self.addHeavenBox()
                self.addHellBox()
                self.createHeavenText()
                self.createHellText()
            }
        } else {
            spawnSoulCenter()
            heavenOrHellMove("undetermined")
            createLowerLabel("You spoke to the soul in fluent \(lang.first!.name.lowercased()), but the soul didn't seem to understand you. It walked away in confusion, stuck in limbo forever.")
            DispatchQueue.global().async{
                LanguageData.shared.newQuery()
            }
        }
    }
}

extension GameScene: SKPhysicsContactDelegate{
    
}
