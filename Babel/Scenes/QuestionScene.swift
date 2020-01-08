//
//  QuestionScene.swift
//  Babel
//
//  Created by Cameron Rivera on 1/7/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation
import SpriteKit

class QuestionScene: SKScene{
    
    var upperTextBox: SKShapeNode?
    var upperText: SKLabelNode?
    var lowerTextBox: SKShapeNode?
    var lowerText: SKLabelNode?
    var enmaName: SKLabelNode?
    var soulName: SKLabelNode?
    var answerOne: SKShapeNode?
    var answerOneText: SKLabelNode?
    var answerTwo: SKShapeNode?
    var answerTwoText: SKLabelNode?
    var answerThree: SKShapeNode?
    var answerThreeText: SKLabelNode?
    var answerFour: SKShapeNode?
    var answerFourText: SKLabelNode?
    
    
    override func didMove(to view: SKView) {
        createLabel(SceneData.shared.upperText)
        createLowerLabel(LanguageData.shared.queryString)
        createUpperTextbox()
        createLowerTextbox()
        addEnma("Enma")
        addSoul("Soul")
        createFirstAnswerTextbox()
        createSecondAnswerTextbox()
        createThirdAnswerTextbox()
        createFourthAnswerTextbox()
        let curLangs = LanguageData.shared.allLanguages.filter{LanguageData.shared.languageData[0].language == $0.code}
        
        if let curl = curLangs.first {
            createAnswerOneTextLabel(curl.name.lowercased())
        }
        let curLangsTwo = LanguageData.shared.allLanguages.filter{LanguageData.shared.languageData[1].language == $0.code}
        if let curl = curLangsTwo.first {
            createAnswerTwoTextLabel(curl.name.lowercased())
        }
        let curLangsThree = LanguageData.shared.allLanguages.filter{LanguageData.shared.languageData[2].language == $0.code}
        if let curl = curLangsThree.first {
            createAnswerThreeTextLabel(curl.name.lowercased())
        }
        let curLangsFour = LanguageData.shared.allLanguages.filter{LanguageData.shared.languageData[3].language == $0.code}
        if let curl = curLangsFour.first {
            createAnswerFourTextLabel(curl.name.lowercased())
        }
    }
    
    // MARK: Create Top Label
    private func createLabel(_ displayText: String){
        upperText = SKLabelNode(text: displayText)
        upperText?.position = CGPoint(x: size.width * 0.05 ,y: size.height * 0.8)
        upperText?.fontColor = SKColor.white
        upperText?.preferredMaxLayoutWidth = size.width * 0.95
        upperText?.lineBreakMode = .byCharWrapping
        upperText?.zPosition = 2.0
        upperText?.fontSize = 25.0
        upperText?.horizontalAlignmentMode = .left
        upperText?.verticalAlignmentMode = .center
        upperText?.numberOfLines = 0
        upperText?.name = "Top Text"
        addChild(upperText!)
    }
    
    // MARK: Create Lower Label
    private func createLowerLabel(_ displayText: String){
        lowerText = SKLabelNode(text: displayText)
        lowerText?.position = CGPoint(x: size.width * 0.05, y: size.height * 0.2)
        lowerText?.fontColor = SKColor.white
        lowerText?.preferredMaxLayoutWidth = size.width * 0.95
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
    
    // MARK: Create Answer Textbox 1
    private func createFirstAnswerTextbox(){
        answerOne = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0.0, y: size.height * 0.31), size: CGSize(width: size.width, height: size.height * 0.08)))
        answerOne?.fillColor = SKColor.black
        answerOne?.zPosition = 1.0
        answerOne?.lineWidth = 2.0
        answerOne?.strokeColor = SKColor.white
        answerOne?.alpha = 0.9
        addChild(answerOne!)
    }
    
    // MARK: Create Answer Label 1
    private func createAnswerOneTextLabel(_ displayText: String){
        answerOneText = SKLabelNode(text: displayText)
        answerOneText?.position = CGPoint(x: size.width * 0.05 ,y: size.height * 0.35)
        answerOneText?.fontColor = SKColor.white
        answerOneText?.preferredMaxLayoutWidth = size.width * 0.95
        answerOneText?.lineBreakMode = .byCharWrapping
        answerOneText?.zPosition = 2.0
        answerOneText?.fontSize = 25.0
        answerOneText?.horizontalAlignmentMode = .left
        answerOneText?.verticalAlignmentMode = .center
        answerOneText?.numberOfLines = 0
        addChild(answerOneText!)
    }
    
    // MARK: Create Answer Textbox 2
    private func createSecondAnswerTextbox(){
        answerTwo = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0.0, y: size.height * 0.41), size: CGSize(width: size.width, height: size.height * 0.08)))
        answerTwo?.fillColor = SKColor.black
        answerTwo?.zPosition = 1.0
        answerTwo?.lineWidth = 2.0
        answerTwo?.strokeColor = SKColor.white
        answerTwo?.alpha = 0.9
        addChild(answerTwo!)
    }
    
    // MARK: Create Answer Label 2
    private func createAnswerTwoTextLabel(_ displayText: String){
        answerTwoText = SKLabelNode(text: displayText)
        answerTwoText?.position = CGPoint(x: size.width * 0.05 ,y: size.height * 0.45)
        answerTwoText?.fontColor = SKColor.white
        answerTwoText?.preferredMaxLayoutWidth = size.width * 0.95
        answerTwoText?.lineBreakMode = .byCharWrapping
        answerTwoText?.zPosition = 2.0
        answerTwoText?.fontSize = 25.0
        answerTwoText?.horizontalAlignmentMode = .left
        answerTwoText?.verticalAlignmentMode = .center
        answerTwoText?.numberOfLines = 0
        addChild(answerTwoText!)
    }
    
    // MARK: Create Answer Textbox 3
    private func createThirdAnswerTextbox(){
        answerThree = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0.0, y: size.height * 0.51), size: CGSize(width: size.width, height: size.height * 0.08)))
        answerThree?.fillColor = SKColor.black
        answerThree?.zPosition = 1.0
        answerThree?.lineWidth = 2.0
        answerThree?.strokeColor = SKColor.white
        answerThree?.alpha = 0.9
        addChild(answerThree!)
    }
    
    // MARK: Create Answer Label 3
    private func createAnswerThreeTextLabel(_ displayText: String){
        answerThreeText = SKLabelNode(text: displayText)
        answerThreeText?.position = CGPoint(x: size.width * 0.05 ,y: size.height * 0.55)
        answerThreeText?.fontColor = SKColor.white
        answerThreeText?.preferredMaxLayoutWidth = size.width * 0.95
        answerThreeText?.lineBreakMode = .byCharWrapping
        answerThreeText?.zPosition = 2.0
        answerThreeText?.fontSize = 25.0
        answerThreeText?.horizontalAlignmentMode = .left
        answerThreeText?.verticalAlignmentMode = .center
        answerThreeText?.numberOfLines = 0
        addChild(answerThreeText!)
    }
    
    // MARK: Create Answer Textbox 4
    private func createFourthAnswerTextbox(){
        answerFour = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0.0, y: size.height * 0.61), size: CGSize(width: size.width, height: size.height * 0.08)))
        answerFour?.fillColor = SKColor.black
        answerFour?.zPosition = 1.0
        answerFour?.lineWidth = 2.0
        answerFour?.strokeColor = SKColor.white
        answerFour?.alpha = 0.9
        addChild(answerFour!)
    }
    
    // MARK: Create Answer Label 4
    private func createAnswerFourTextLabel(_ displayText: String){
        answerFourText = SKLabelNode(text: displayText)
        answerFourText?.position = CGPoint(x: size.width * 0.05 ,y: size.height * 0.65)
        answerFourText?.fontColor = SKColor.white
        answerFourText?.preferredMaxLayoutWidth = size.width * 0.95
        answerFourText?.lineBreakMode = .byCharWrapping
        answerFourText?.zPosition = 2.0
        answerFourText?.fontSize = 25.0
        answerFourText?.horizontalAlignmentMode = .left
        answerFourText?.verticalAlignmentMode = .center
        answerFourText?.numberOfLines = 0
        addChild(answerFourText!)
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
    
    // MARK: Transitions back to the Game Scene
    func transition(){
        //let transition = SKTransition.reveal(with: .up, duration: 1.0)
        TransitionManager.shared.transition(self, .gameScene, size)
    }
    
    // MARK: Detects touches. 
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let locationOne = touch.location(in: answerOne!)
            let locationTwo = touch.location(in: answerTwo!)
            let locationThree = touch.location(in: answerThree!)
            let locationFour = touch.location(in: answerFour!)
            
            switch touch{
            case _ where answerOne!.contains(locationOne):
                SceneData.shared.usersChoice = LanguageData.shared.languageData[0]
                SceneData.shared.selectedCorrectly = LanguageData.shared.checkChoice(LanguageData.shared.languageData[0])
                transition()
                
            case _ where answerTwo!.contains(locationTwo):
                SceneData.shared.usersChoice = LanguageData.shared.languageData[1]
                SceneData.shared.selectedCorrectly = LanguageData.shared.checkChoice(LanguageData.shared.languageData[1])
                transition()
            case _ where answerThree!.contains(locationThree):
                SceneData.shared.usersChoice = LanguageData.shared.languageData[2]
                SceneData.shared.selectedCorrectly = LanguageData.shared.checkChoice(LanguageData.shared.languageData[2])
                transition()
            case _ where answerFour!.contains(locationFour):
                SceneData.shared.usersChoice = LanguageData.shared.languageData[3]
                SceneData.shared.selectedCorrectly = LanguageData.shared.checkChoice(LanguageData.shared.languageData[3])
                transition()
            default:
                break
            }
        }
    }
}
