//
//  GameScene4.swift
//  Duck
//
//  Created by Caden Christesen on 4/13/24.
//

import SpriteKit

class LevelSelectScene: SKScene {
    
    var currentIndex = 0
    var duckSprites: [SKSpriteNode] = []
    var ogDuck: SKSpriteNode!
    var fireDuck: SKSpriteNode!
    var earthDuck: SKSpriteNode!
    var selectionArrowLeft: SKSpriteNode!
    var selectionArrowRight: SKSpriteNode!
    
   public static var level1Complete = false
   public static var level2Complete = false
   public static var level3Complete = false
    
    public static var gameIsActive = true
    
    override func didMove(to view: SKView) {
        createBackground()
        createButtons()
        let backgroundSound = SKAudioNode(fileNamed: "QuackCharacterSelect")
        self.addChild(backgroundSound)
    }
    
    func createBackground() {
        let river = SKTexture(imageNamed: "RiverBackdrop")
        for i in 0...1 {
            let riverBackground = SKSpriteNode(texture: river)
            riverBackground.zPosition = -3
            riverBackground.position = CGPoint(x: 0, y: riverBackground.size.height * CGFloat(i))
            addChild((riverBackground))
        }
    }
    

    
    func createButtons() {
        
        let normalTexture2 = SKTexture(imageNamed: "blankButton")
        
        let selectedTexture2 = SKTexture(imageNamed: "blankButtonSelected")
        
        //button 1
        
        let selectButton1 = Level1Button(defaultTexture: SKTexture(imageNamed: "LevelButton1"), selectedTexture: SKTexture(imageNamed: "LevelButton1Selected"), size: CGSize(width: 250, height: 250))
        selectButton1.position = CGPoint(x: frame.midX - 15, y: frame.midY - 900)
        selectButton1.zPosition = -1
        addChild(selectButton1)
        let moveUp1 = SKAction.moveTo(y: frame.midY - 425, duration: 0.5)
        selectButton1.run(moveUp1)
        
        //button 2
        
        let selectButton2 = Level2Button(defaultTexture: SKTexture(imageNamed: "LevelButton2"), selectedTexture: SKTexture(imageNamed: "LevelButton2Selected"), size: CGSize(width: 250, height: 250))
        selectButton2.position = CGPoint(x: frame.midX - 50, y: frame.midY - 900)
        selectButton2.zPosition = -1
        addChild(selectButton2)
        let moveUp2 = SKAction.moveTo(y: frame.midY, duration: 0.5)
        selectButton2.run(moveUp2)
        
        //button 3
        
        let selectButton3 = Level3Button(defaultTexture: SKTexture(imageNamed: "LevelButton3"), selectedTexture: SKTexture(imageNamed: "LevelButton3Selected"), size: CGSize(width: 250, height: 250))
        selectButton3.position = CGPoint(x: frame.midX - 52, y: frame.midY - 900)
        selectButton3.zPosition = -1
        addChild(selectButton3)
        let moveUp3 = SKAction.moveTo(y: frame.midY + 425, duration: 0.5)
        selectButton3.run(moveUp3)
        
        if LevelSelectScene.level3Complete == true {
            let Lock3 = SKTexture(imageNamed: "redX")
            let lock3sprite = SKSpriteNode(texture: Lock3)
            lock3sprite.position = CGPoint(x: frame.midX - 52, y: frame.midY - 900)
            lock3sprite.size  = CGSize(width: 100, height: 100)
            lock3sprite.run(moveUp3)


            addChild(lock3sprite)
            
        }
        
        
        let normalTexture1 = SKTexture(imageNamed: "ActualBackButton")
        let selectedTexture1 = SKTexture(imageNamed: "ActualBackButton")
        let customBackButton = CustomBackButton(defaultTexture: normalTexture1, selectedTexture: selectedTexture1, size: CGSize(width: 250, height: 250))
        customBackButton.position = CGPoint(x: frame.midX - 225 , y: frame.midY + 575)
        customBackButton.zPosition = -1
        addChild(customBackButton)
    }
}
