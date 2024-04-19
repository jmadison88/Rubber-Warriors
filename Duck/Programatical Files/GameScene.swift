//
//  GameScene.swift
//  Duck
//
//  Created by Josh Madison on 3/21/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var titleLabel = SKLabelNode()
    var originalDuck = SKSpriteNode()
    var startButton = SKSpriteNode()
    var duck = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        createButtons()
        createBackground()
        createLabels()
        createDucks()
        let backgroundSound = SKAudioNode(fileNamed: "Quack_Attack")
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
        let logo = SKTexture(imageNamed: "RubberWarriorsLogo")
        let rubberWarriorsLogo = SKSpriteNode(texture: logo)
        rubberWarriorsLogo.position = CGPoint(x: frame.midX, y: frame.maxY - 250)
        rubberWarriorsLogo.zPosition = -2
        addChild(rubberWarriorsLogo)
        let scaleBackward = SKAction.scale(to: 0.25, duration: 0.2)
        let scaleForward = SKAction.scale(to: 1.25, duration: 0.3)
        let scaleBackward2 = SKAction.scale(to: 1, duration: 0.2)
        let scaleSequence = SKAction.sequence([scaleBackward, scaleForward, scaleBackward2])
        rubberWarriorsLogo.run(scaleSequence)
        
        let arrow = SKTexture(imageNamed: "Arrow")
        let pointerArrow = SKSpriteNode(texture: arrow)
        pointerArrow.position = CGPoint(x: frame.midX - 175, y: frame.minY + 150)
        pointerArrow.size = CGSize(width: 200.0, height: 200.0)
        pointerArrow.zPosition = 1

        pointerArrow.run(scaleSequence)
        let backward = SKAction.moveBy(x: -50, y: 0, duration: 1.5)
        let forward = SKAction.moveBy(x: 50, y: 0, duration: 1.5)
        let backAndForth = SKAction.sequence([backward, forward])
        let backAndForthForever = SKAction.repeatForever(backAndForth)
        pointerArrow.run(backAndForthForever)
    }
    
    func createButtons() {
        let normalTexture = SKTexture(imageNamed: "startButton")
        let selectedTexture = SKTexture(imageNamed: "selectedButton")
        let customButton = FirstButton(defaultTexture: normalTexture, selectedTexture: selectedTexture, size: CGSize(width: 250, height: 250))
        customButton.position = CGPoint(x: frame.midX, y: frame.midY - 900)
        customButton.zPosition = -1
        addChild(customButton)
        let moveUp = SKAction.moveTo(y: frame.midY - 525, duration: 0.5)
        customButton.run(moveUp)
        
        let arrowLeft = SKTexture(imageNamed: "selectionArrow")
        let selectionArrowLeft = SKSpriteNode(texture: arrowLeft)
        selectionArrowLeft.position = CGPoint(x: frame.midX - 50, y: frame.midY)
    }
    
    func createDucks() {
        let duck1 = SKTexture(imageNamed: "Original")
        duck = SKSpriteNode(texture: duck1, size: CGSize(width: 100, height: 100))
        duck.zPosition = 0
        addChild(duck)
        let move = SKAction.move(to: CGPoint(x: 100, y: 100), duration: 1.0)
        let move2 = SKAction.move(to: CGPoint(x: 0, y: -100), duration: 2.0)
        let move3 = SKAction.move(to: CGPoint(x: -100, y: -75), duration: 2.0)
        let wait = SKAction.wait(forDuration: 1.0)
        let reset = SKAction.move(to: CGPoint(x: 0.0, y: 0.0), duration: 1.0)
        let changeTexture = SKAction.run {
            let newTexture = SKTexture(imageNamed: "OriginalSwimming-01")
            self.duck.texture = newTexture
        }
        let changeTexture2 = SKAction.run {
            let newTexture = SKTexture(imageNamed: "Original")
            self.duck.texture = newTexture
            self.duck.xScale = 1
        }
        let changeTexture3 = SKAction.run {
            let newTexture = SKTexture(imageNamed: "Original")
            self.duck.texture = newTexture
            self.duck.xScale = -1
        }
        let sequence = SKAction.sequence([changeTexture3, move, wait, changeTexture3, changeTexture, wait, changeTexture2, move2, changeTexture, wait, changeTexture2, move3, changeTexture, wait, changeTexture2, changeTexture3, reset])
        let sequenceForever = SKAction.repeatForever(sequence)
        duck.run(sequenceForever)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}
