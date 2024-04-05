//
//  GameScene2.swift
//  Duck
//
//  Created by Josh Madison on 3/21/24.
//

import SpriteKit
import GameplayKit //Havent fully figured out gameplay kit but always import no matter what to coincide with SpriteKit

class GameScene2: SKScene { //SKScene is how we are seeing any of the stuff on screen, see buttons for custom classes
    
    var ogDuck = SKSpriteNode()
    var FireDuck = SKSpriteNode()
    var EarthDuck = SKSpriteNode()
    var currentIndex = 0
    var mySprites: [SKSpriteNode] = []

    override func didMove(to view: SKView) { //Runs when the certain screen is opened, creating background, buttons, and labels.
        createBackground()
        createButtons()
        createLabels()
        let backgroundSound = SKAudioNode(fileNamed: "QuackCharacterSelect")
        self.addChild(backgroundSound)

    }
    
    func createBackground() { //Originally supposed to be a moving background but changed so loop does not matter
        let river = SKTexture(imageNamed: "duckgamebackground")
        for i in 0...1 {
            let riverBackground = SKSpriteNode(texture: river)
            riverBackground.zPosition = -3
            riverBackground.position = CGPoint(x: 0, y: riverBackground.size.height * CGFloat(i))
            addChild((riverBackground))
        }
    }
    
    func createLabels() { //Function created by me to run in didMove()
        
        let logo = SKTexture(imageNamed: "ChooseYourDucks") //private variables can be established by any SKNode(SKSpriteNode, SKTexture, etc.)
        let chooseADuck = SKSpriteNode(texture: logo)
        chooseADuck.position = CGPoint(x: frame.midX, y: frame.maxY - 300) //Once established, vars use modifiers kind of in the same way as .modifier
        chooseADuck.size = CGSize(width: 115, height: 115)
        chooseADuck.zPosition = -2
        addChild(chooseADuck) //actually adds the item to the scene
        let scaleBackward = SKAction.scale(to: 0.25, duration: 0.2) //These are extra movement variables to make it have that bouncy effect
        let scaleForward = SKAction.scale(to: 6, duration: 0.3)
        let scaleBackward2 = SKAction.scale(to: 5, duration: 0.2)
        let scaleSequence = SKAction.sequence([scaleForward, scaleBackward2])
        chooseADuck.run(scaleSequence)
        
        let OGDuck = SKTexture(imageNamed: "Original") //Work in progress due to arrays
        let fireDuck = SKTexture(imageNamed: "Fire")
        let earthDuck = SKTexture(imageNamed: "Earth")
        EarthDuck = SKSpriteNode(texture: OGDuck, size: CGSize(width: 60, height: 40))
        ogDuck = SKSpriteNode(texture: OGDuck, size: CGSize(width: 60, height: 40))
        FireDuck = SKSpriteNode(texture: fireDuck, size: CGSize(width: 60, height: 40))
        ogDuck.position = CGPoint(x: frame.midX, y: frame.midY - 60)
        ogDuck.size = CGSize(width: 50.0, height: 50.0)
        addChild(ogDuck) //actually adds the item to the scene
        ogDuck.run(scaleSequence)
    }
    
    func createButtons() { //Function created by me to run in didMove()
        //Might look confusing at first, but split up to differentiate between items keeping code organized
        
        let normalTexture = SKTexture(imageNamed: "backButton")
        let selectedTexture = SKTexture(imageNamed: "backButtonSelected")
        let customButton = CustomBackButton(defaultTexture: normalTexture, selectedTexture: selectedTexture, size: CGSize(width: 250, height: 250))
        //refer to custom button files for more
        customButton.position = CGPoint(x: frame.midX - 200, y: frame.midY + 900)
        customButton.zPosition = -1
        addChild(customButton) //actually adds the item to the scene
        let moveDown = SKAction.moveTo(y: frame.midY + 575, duration: 0.5)
        customButton.run(moveDown)
        
        let arrowLeft = SKTexture(imageNamed: "selectionArrow")
        let selectionArrowLeft = SKSpriteNode(texture: arrowLeft)
        selectionArrowLeft.name = "selectionArrowLeft"
        selectionArrowLeft.position = CGPoint(x: frame.midX - 250, y: frame.midY - 60)
        selectionArrowLeft.size = CGSize(width: 200, height: 200)
        addChild(selectionArrowLeft) //actually adds the item to the scene
        
        let arrowRight = SKTexture(imageNamed: "selectionArrow")
        let selectionArrowRight = SKSpriteNode(texture: arrowRight)
        selectionArrowRight.name = "selectionArrowRight"
        selectionArrowRight.position = CGPoint(x: frame.midX + 250, y: frame.midY - 60)
        selectionArrowRight.size = CGSize(width: 200, height: 200)
        selectionArrowRight.xScale = -1
        addChild(selectionArrowRight) //actually adds the item to the scene
        
        let selectTexture = SKTexture(imageNamed: "SelectButton")
        let selectedButtonTexture = SKTexture(imageNamed: "SelectButtonSelected")
        let selectButton = SelectButton(defaultTexture: selectTexture, selectedTexture: selectedButtonTexture, size: CGSize(width: 250, height: 250))
        selectButton.position = CGPoint(x: frame.midX, y: frame.midY - 300)
        selectButton.zPosition = -1
        addChild(selectButton) //actually adds the item to the scene
    }
    
    func createDucks() { //Function created by me to run in didMove() (not done yet)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //touchesBegan is a function that handles touch interaction
        for touch in touches { //essentially a loop to always be looking for touches
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

