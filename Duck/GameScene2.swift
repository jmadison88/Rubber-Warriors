//
//  GameScene2.swift
//  Duck
//
//  Created by Josh Madison on 3/21/24.
//

import SpriteKit
import GameplayKit

class GameScene2: SKScene {
    
    var ogDuck = SKSpriteNode()
    var FireDuck = SKSpriteNode()
    var EarthDuck = SKSpriteNode()
    var currentIndex = 0
    var mySprites: [SKSpriteNode] = []

    override func didMove(to view: SKView) {
        createBackground()
        createButtons()
        createLabels()
        let backgroundSound = SKAudioNode(fileNamed: "QuackCharacterSelect")
        self.addChild(backgroundSound)

    }
    
    func createBackground() {
        let river = SKTexture(imageNamed: "duckgamebackground")
        for i in 0...1 {
            let riverBackground = SKSpriteNode(texture: river)
            riverBackground.zPosition = -3
            riverBackground.position = CGPoint(x: 0, y: riverBackground.size.height * CGFloat(i))
            addChild((riverBackground))
        }
    }
    
    func createLabels() {
        let logo = SKTexture(imageNamed: "ChooseYourDucks")
        let chooseADuck = SKSpriteNode(texture: logo)
        chooseADuck.position = CGPoint(x: frame.midX, y: frame.maxY - 300)
        chooseADuck.size = CGSize(width: 115, height: 115)
        chooseADuck.zPosition = -2
        addChild(chooseADuck)
        let scaleBackward = SKAction.scale(to: 0.25, duration: 0.2)
        let scaleForward = SKAction.scale(to: 6, duration: 0.3)
        let scaleBackward2 = SKAction.scale(to: 5, duration: 0.2)
        let scaleSequence = SKAction.sequence([scaleForward, scaleBackward2])
        chooseADuck.run(scaleSequence)
        
        let OGDuck = SKTexture(imageNamed: "Original")
        let fireDuck = SKTexture(imageNamed: "Fire")
        let earthDuck = SKTexture(imageNamed: "Earth")
        EarthDuck = SKSpriteNode(texture: OGDuck, size: CGSize(width: 60, height: 40))
        ogDuck = SKSpriteNode(texture: OGDuck, size: CGSize(width: 60, height: 40))
        FireDuck = SKSpriteNode(texture: fireDuck, size: CGSize(width: 60, height: 40))
        ogDuck.position = CGPoint(x: frame.midX, y: frame.midY - 60)
        ogDuck.size = CGSize(width: 50.0, height: 50.0)
        addChild(ogDuck)
        ogDuck.run(scaleSequence)
    }
    
    func createButtons() {
        let normalTexture = SKTexture(imageNamed: "backButton")
        let selectedTexture = SKTexture(imageNamed: "backButtonSelected")
        let customButton = CustomBackButton(defaultTexture: normalTexture, selectedTexture: selectedTexture, size: CGSize(width: 250, height: 250))
        customButton.position = CGPoint(x: frame.midX - 200, y: frame.midY + 900)
        customButton.zPosition = -1
        addChild(customButton)
        let moveDown = SKAction.moveTo(y: frame.midY + 575, duration: 0.5)
        customButton.run(moveDown)
        
        let arrowLeft = SKTexture(imageNamed: "selectionArrow")
        let selectionArrowLeft = SKSpriteNode(texture: arrowLeft)
        selectionArrowLeft.name = "selectionArrowLeft"
        selectionArrowLeft.position = CGPoint(x: frame.midX - 250, y: frame.midY - 60)
        selectionArrowLeft.size = CGSize(width: 200, height: 200)
        addChild(selectionArrowLeft)
        
        let arrowRight = SKTexture(imageNamed: "selectionArrow")
        let selectionArrowRight = SKSpriteNode(texture: arrowRight)
        selectionArrowRight.name = "selectionArrowRight"
        selectionArrowRight.position = CGPoint(x: frame.midX + 250, y: frame.midY - 60)
        selectionArrowRight.size = CGSize(width: 200, height: 200)
        selectionArrowRight.xScale = -1
        addChild(selectionArrowRight)
        
        let selectTexture = SKTexture(imageNamed: "SelectButton")
        let selectedButtonTexture = SKTexture(imageNamed: "SelectButtonSelected")
        let selectButton = SelectButton(defaultTexture: selectTexture, selectedTexture: selectedButtonTexture, size: CGSize(width: 250, height: 250))
        selectButton.position = CGPoint(x: frame.midX, y: frame.midY - 300)
        selectButton.zPosition = -1
        addChild(selectButton)
    }
    
    func createDucks() {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "selectionArrowRight" {
                currentIndex += 1
                print("+1")
                for currentIndex in 0..<mySprites.count {
                    let currentSprite = mySprites[currentIndex]
                    ogDuck = currentSprite
                }
            }
            else if touchedNode.name == "selectionArrowLeft" {
                currentIndex += -1
                print("-1")
                for currentIndex in 0..<mySprites.count {
                    let currentSprite = mySprites[currentIndex]
                    
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
}

