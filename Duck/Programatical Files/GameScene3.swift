
//  GameScene3.swift
//  Duck
//
//  Created by Caden Christesen on 4/10/24.
//

import SpriteKit
class GameScene3: SKScene {
    
    // State variables
    var subtractButton: SKSpriteNode!
    var heavyButton: SKSpriteNode!
    var dodgeButton: SKSpriteNode!
    var hpLabel = SKLabelNode(fontNamed: "Verdana-Bold")
    var duckhealthlabel = SKLabelNode(fontNamed: "Verdana-Bold")
    var duckStaminaLabel = SKLabelNode(fontNamed: "Verdana-Bold")
    var playerTurn = "Goose"
    var enemyHp = 100
    var DuckStam = 100
    var duckHealth = 100
    
    
    static var selectedDuck: SKSpriteNode?
        
    var gooseDisplay: SKLabelNode!
    
    override func didMove(to view: SKView) {
        createBackground()
        createLabel()
        createGoose()
        createSubtractButton()
        createDuck()
        createDodgeButton()
        heavyAttackButton()

    }
    
    func createBackground() {
        let river = SKTexture(imageNamed: "duckgamebackgroundbattle")
        for i in 0...1 {
            let riverBackground = SKSpriteNode(texture: river)
            riverBackground.zPosition = -3
            riverBackground.position = CGPoint(x: 0, y: riverBackground.size.height * CGFloat(i))
            addChild((riverBackground))
        }
    }
        // Add your scene elements here
    func createLabel(){
        let turnLabel = SKLabelNode(fontNamed: "Verdana-Bold")
                turnLabel.text = "Turn: \(playerTurn)"
                turnLabel.fontSize = 24
                turnLabel.fontColor = .black
                turnLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 300)
                addChild(turnLabel)

                // Remove redeclaration of hpLabel
                hpLabel.text = "Enemy HP: \(enemyHp)"
                hpLabel.fontSize = 24
                hpLabel.fontColor = .black
                hpLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 350)
                addChild(hpLabel)
        

        
        duckhealthlabel.text = "Health HP: \(duckHealth)"
        duckhealthlabel.fontSize = 24
        duckhealthlabel.fontColor = .black
        duckhealthlabel.position = CGPoint(x: frame.midX, y: frame.maxY - 400)
        addChild(duckhealthlabel)

                turnLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 250)
        
        duckStaminaLabel.text = "Duck Stamina: \(DuckStam)"
        duckStaminaLabel.fontSize = 24
        duckStaminaLabel.fontColor = .black
        duckStaminaLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 450)
        addChild(duckStaminaLabel)

                turnLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 150)
        
    }
    
    func createGoose(){
        var badSprite = SKSpriteNode(imageNamed: "")
                if enemyHp > 0 {
                    badSprite = SKSpriteNode(imageNamed: "goose")
                } else {
                    badSprite = SKSpriteNode(imageNamed: "goosesketch")
                }
                badSprite.size = CGSize(width: 200, height: 200)
                badSprite.position = CGPoint(x: frame.midX, y: frame.midY + 100)
                addChild(badSprite)
    }
    
    func createDuck() {
        if let selectedDuck = GameScene3.selectedDuck {
               // Remove the selected duck from its current parent node
               selectedDuck.removeFromParent()
               
               // Set size and position of the selected duck
               selectedDuck.size = CGSize(width: 500, height: 500)
               selectedDuck.position = CGPoint(x: frame.midX, y: frame.midY - 300)
            selectedDuck.zPosition = 3
               
               // Add the selected duck to GameScene3
               addChild(selectedDuck)
           } else {
               print("No selected duck found.")
           }
    }
    
    
    
    func createSubtractButton() {
            // Create subtract button
        let SubtractButton = SKTexture(imageNamed: "LightAttackButton")
        subtractButton = SKSpriteNode(texture: SubtractButton, size: CGSize(width: 250, height: 250))
        subtractButton.position = CGPoint(x: frame.midX - 125, y: frame.midY - 400)
            subtractButton.name = "subtractButton"
            subtractButton.zPosition = 1
            addChild(subtractButton)
        }
    
    func heavyAttackButton() {
            // Create subtract button
        let HeavyButton = SKTexture(imageNamed: "HeavyAttackButton")
        heavyButton = SKSpriteNode(texture: HeavyButton, size: CGSize(width: 250, height: 250))
        heavyButton.position = CGPoint(x: frame.midX - 125, y: frame.midY - 535)
            heavyButton.name = "heavyButton"
            heavyButton.zPosition = 1
            addChild(heavyButton)
        }
    
    func createDodgeButton() {
        let DodgeButton = SKTexture(imageNamed: "DodgeButton")
        dodgeButton = SKSpriteNode(texture: DodgeButton, size: CGSize(width: 250, height: 250))
        dodgeButton.position = CGPoint(x: frame.midX + 100, y: frame.midY - 400)
        dodgeButton.name = "dodgeButton"
        addChild(dodgeButton)
        
        
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                let location = touch.location(in: self)
                let touchedNode = self.atPoint(location)
                
                if touchedNode.name == "subtractButton" {
                    subtractHP()
                    gooseAttack()
                    duckhealthlabel.text = "Health HP: \(duckHealth)"
                }
                if touchedNode.name == "heavyButton" {
                    subtractHPHeavy()
                    gooseAttack()
                    duckhealthlabel.text = "Health HP: \(duckHealth)"
                }
                if touchedNode.name == "dodgeButton" {
                    gooseDodgeAttack()
                    gooseAttack()
                    duckhealthlabel.text = "Health HP: \(duckHealth)"
                }
            }
        }
    func gooseAttack() {
        let damage = CGFloat(arc4random_uniform(5) + 5)
        duckHealth -= Int(damage)
        duckhealthlabel.text = "duckHP: \(duckHealth)"
    }
    func gooseDodgeAttack() {
        let damage = CGFloat(arc4random_uniform(5))
        duckHealth -= Int(damage)
        DuckStam = 100
        duckStaminaLabel.text = "Duck Stamina: \(DuckStam)"
    }
    
    func subtractHP() {
        DuckStam -= 10
        duckStaminaLabel.text = "Duck Stamina: \(DuckStam)"
        let damage = CGFloat(arc4random_uniform(10) + 5)
        enemyHp -= Int(damage)
            hpLabel.text = "Enemy HP: \(enemyHp)"
        }
    func subtractHPHeavy() {
        DuckStam -= 15
        duckStaminaLabel.text = "Duck Stamina: \(DuckStam)"
        let damage = CGFloat(arc4random_uniform(15) + 5)
        enemyHp -= Int(damage)
            hpLabel.text = "Enemy HP: \(enemyHp)"
        }
    
    override func update(_ currentTime: TimeInterval) {
        hpLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 350)
                // Update HP label text
                hpLabel.text = "Enemy HP: \(enemyHp)"
        duckhealthlabel.position = CGPoint(x: frame.midX, y: frame.maxY - 400)
        duckhealthlabel.text = "duckHP: \(duckHealth)"
        duckStaminaLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 450)
        duckStaminaLabel.text = "Duck Stamina: \(DuckStam)"
        
    }
    
    
    
}

