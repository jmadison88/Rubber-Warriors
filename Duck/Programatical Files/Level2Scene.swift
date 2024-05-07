//
//  Level2Scene.swift
//  Duck
//
//  Created by Caden Christesen on 5/3/24.
//

import SpriteKit
class Level2Scene: SKScene {
    
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
    var badSprite = SKSpriteNode(imageNamed: "")
    var duckHealthBar: SKShapeNode!
    var enemyHealthBar: SKShapeNode!
    var staminaBar: SKShapeNode!
    var goodSprite = SKSpriteNode(imageNamed: "")
    
    
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
        createHealthBars()


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
        duckStaminaLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 300)
        addChild(duckStaminaLabel)

                turnLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 150)
        
    }
    func createHealthBars() {
            // Create health bars for duck and enemy duck
            let healthBarSize = CGSize(width: 200, height: 20)
            
            duckHealthBar = SKShapeNode(rectOf: healthBarSize)
            duckHealthBar.fillColor = .green
            duckHealthBar.position = CGPoint(x: frame.midX, y: frame.midY - 300)
            addChild(duckHealthBar)
        
        
            
            enemyHealthBar = SKShapeNode(rectOf: healthBarSize)
            enemyHealthBar.fillColor = .red
            enemyHealthBar.position = CGPoint(x: frame.midX, y: frame.maxY - 450)
            addChild(enemyHealthBar)
        
        staminaBar = SKShapeNode(rectOf: healthBarSize)
        staminaBar.fillColor = .yellow
        staminaBar.position = CGPoint(x: frame.midX, y: frame.midY - 270)
        addChild(staminaBar)
        }
    
    func createGoose(){
                if enemyHp > 0 {
                    badSprite = SKSpriteNode(imageNamed: "canadagoose")
                } else {
                    badSprite = SKSpriteNode(imageNamed: "goosesketch")
                }
                badSprite.size = CGSize(width: 200, height: 200)
                badSprite.position = CGPoint(x: frame.midX, y: frame.midY + 100)
                addChild(badSprite)
    }
    
    func createDuck() {
        goodSprite = SKSpriteNode(imageNamed: TitleScene.Duck)
        goodSprite.size = CGSize(width: 200, height: 200)
        goodSprite.position = CGPoint(x: frame.midX, y: frame.midY - 100)
        addChild(goodSprite)
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
                    if DuckStam >= 10 {
                        subtractHP()
                    }
                    gooseAttack()
                    duckhealthlabel.text = "Health HP: \(duckHealth)"
                }
                if touchedNode.name == "heavyButton" {
                    if DuckStam >= 15 {
                        subtractHPHeavy()
                    }
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
        let duckHealthPercentage = CGFloat(duckHealth) / 100.0
                duckHealthBar.xScale = duckHealthPercentage
                
                let enemyHealthPercentage = CGFloat(enemyHp) / 100.0
                enemyHealthBar.xScale = enemyHealthPercentage
        
        let staminaPercentage = CGFloat(DuckStam) / 100.0
        staminaBar.xScale = staminaPercentage
                
        
        hpLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 350)
                // Update HP label text
                hpLabel.text = "Enemy HP: \(enemyHp)"
        duckhealthlabel.position = CGPoint(x: frame.midX, y: frame.maxY - 400)
        duckhealthlabel.text = "duckHP: \(duckHealth)"
        duckStaminaLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 300)
        duckStaminaLabel.text = "Duck Stamina: \(DuckStam)"
        if enemyHp <= 0 {
            badSprite.texture = SKTexture(imageNamed: "goosesketch")
        }
        
    }
    
    
    
}

