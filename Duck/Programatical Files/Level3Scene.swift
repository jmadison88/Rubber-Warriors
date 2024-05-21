//
//  Level3Scene.swift
//  Duck
//
//  Created by Caden Christesen on 5/3/24.
//


import SpriteKit
class Level3Scene: SKScene {
    
    // State variables
    
    var subtractButton: SKSpriteNode!
    var heavyButton: SKSpriteNode!
    var dodgeButton: SKSpriteNode!
    var hpLabel = SKLabelNode(fontNamed: "Verdana-Bold")
    var duckhealthlabel = SKLabelNode(fontNamed: "Verdana-Bold")
    var duckStaminaLabel = SKLabelNode(fontNamed: "Verdana-Bold")
    var turnLabel = SKLabelNode(fontNamed: "Verdana-Bold")
    var playerTurn = "Goose"
    var enemyHp = 100
    var DuckStam = 152
    var duckHealth = 152
    var badSprite = SKSpriteNode(imageNamed: "")
    var duckHealthBar: SKShapeNode!
    var enemyHealthBar: SKShapeNode!
    var staminaBar: SKShapeNode!
    var goodSprite = SKSpriteNode(imageNamed: "")
    var victory = SKSpriteNode(imageNamed: "victory")
    var defeat = SKSpriteNode(imageNamed: "defeat")
    
    
    
    var gameIsActive = true
    
    var backButtonCreated = false
    
    
    static var selectedDuck: SKSpriteNode?
    
    var gooseDisplay: SKLabelNode!
    
    override func didMove(to view: SKView) {
        if(TitleScene.Duck == "Fire"){
            duckHealth = 200
            DuckStam = 104
        }else if (TitleScene.Duck == "Water"){
            duckHealth = 192
            DuckStam = 112
        }else if (TitleScene.Duck == "Earth"){
            duckHealth = 184
            DuckStam = 120
        }else if (TitleScene.Duck == "Healing"){
            duckHealth = 176
            DuckStam = 128
        }else if (TitleScene.Duck == "Ice"){
            duckHealth = 168
            DuckStam = 136
        }else if (TitleScene.Duck == "Cheetah"){
            duckHealth = 160
            DuckStam = 144
        }else if (TitleScene.Duck == "Studious"){
            duckHealth = 152
            DuckStam = 152
        }else if (TitleScene.Duck == "Soccer"){
            duckHealth = 144
            DuckStam = 160
        }else if (TitleScene.Duck == "Special"){
            duckHealth = 136
            DuckStam = 168
        }else if (TitleScene.Duck == "HighSpawnChance"){
            duckHealth = 128
            DuckStam = 176
        }else if (TitleScene.Duck == "Superhero"){
            duckHealth = 120
            DuckStam = 184
        }else if (TitleScene.Duck == "Biker"){
            duckHealth = 112
            DuckStam = 192
        }else{
            duckHealth = 104
            DuckStam = 200
        }
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
        let river = SKTexture(imageNamed: "duckgamebackground")
        for i in 0...1 {
            let riverBackground = SKSpriteNode(texture: river)
            riverBackground.zPosition = -3
            riverBackground.position = CGPoint(x: 0, y: riverBackground.size.height * CGFloat(i))
            addChild((riverBackground))
        }
    }
    
    // Add your scene elements here
    func createLabel(){
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
        //     addChild(hpLabel)
        
        
        
        duckhealthlabel.text = "Health HP: \(duckHealth)"
        duckhealthlabel.fontSize = 24
        duckhealthlabel.fontColor = .black
        duckhealthlabel.position = CGPoint(x: frame.midX, y: frame.maxY - 400)
        //   addChild(duckhealthlabel)
        
        turnLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 250)
        
        duckStaminaLabel.text = "Duck Stamina: \(DuckStam)"
        duckStaminaLabel.fontSize = 24
        duckStaminaLabel.fontColor = .black
        duckStaminaLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 300)
        // addChild(duckStaminaLabel)
        
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
            badSprite = SKSpriteNode(imageNamed: "rgbgoose")
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
    
    func showResultPopup(result: String) {
        // Create pop-up node
        let popupNode = SKSpriteNode(color: UIColor.white, size: CGSize(width: 300, height: 200))
        popupNode.position = CGPoint(x: frame.midX, y: frame.midY)
        
        let resultLabel = SKLabelNode(text: result)
        resultLabel.fontName = "Verdana-Bold"
        resultLabel.fontSize = 24
        resultLabel.fontColor = .black
        resultLabel.position = CGPoint(x: popupNode.frame.midX, y: popupNode.frame.midY)
        popupNode.addChild(resultLabel)
        
        addChild(popupNode)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard gameIsActive else {
            return // If the game is over, return without processing touches
        }
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            
            if touchedNode.name == "subtractButton" {
                if DuckStam >= 10 {
                    subtractHP()
                }
                let gooseSurprised = SKAction.moveTo(y: frame.midY + 150, duration: 0.1)
                let gooseSurprised2 = SKAction.moveTo(y: frame.midY + 100, duration: 0.1)
                let attackUp1 = SKAction.moveTo(y: frame.midY + 100, duration: 0.1)
                let attackBack1 = SKAction.moveTo(y: frame.midY - 100, duration: 0.1)
                let attackSequence1 = SKAction.sequence([attackUp1, attackBack1])
                let gooseSequence = SKAction.sequence([gooseSurprised, gooseSurprised2])
                goodSprite.run(attackSequence1)
                badSprite.run(gooseSequence)
                ifgooseSurprised()
                gooseAttack()
                duckhealthlabel.text = "Health HP: \(duckHealth)"
            }
            if touchedNode.name == "heavyButton" {
                if DuckStam >= 15 {
                    subtractHPHeavy()
                }
                let backUp = SKAction.moveTo(y: frame.midY - 200, duration: 1)
                let attackUp2 = SKAction.moveTo(y: frame.midY + 100, duration: 0.1)
                let attackBack2 = SKAction.moveTo(y: frame.midY - 100, duration: 0.1)
                let gooseSurprised12 = SKAction.moveTo(y: frame.midY + 150, duration: 0.1)
                let gooseSurprised1 = SKAction.moveTo(y: frame.midY + 100, duration: 0.1)
                let attackSequence2 = SKAction.sequence([backUp, attackUp2, attackBack2])
                let gooseSequence1 = SKAction.sequence([gooseSurprised12, gooseSurprised1])
                goodSprite.run(attackSequence2)
                ifgooseSurprised2()
                gooseAttack()
                duckhealthlabel.text = "Health HP: \(duckHealth)"
            }
            if touchedNode.name == "dodgeButton" {
                let dodgeRight = SKAction.moveTo(x: frame.midX + 50, duration: 0.1)
                let dodgeBack = SKAction.moveTo(x: frame.midX, duration: 0.1)
                let dodgeSequence = SKAction.sequence([dodgeRight, dodgeBack])
                goodSprite.run(dodgeSequence)
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
    
    func ifgooseSurprised() {
        let changeToNewTexture = SKAction.setTexture(SKTexture(imageNamed: "surprisedrgbgoose"))
        let waitDuration = 0.5 // Change this to the desired wait time in seconds
        let waitAction = SKAction.wait(forDuration: waitDuration)
        let changeBackToOriginalTexture = SKAction.setTexture(SKTexture(imageNamed: "rgbgoose"))
        let sequence = SKAction.sequence([changeToNewTexture, waitAction, changeBackToOriginalTexture])
                badSprite.run(sequence)
    }
    func ifgooseSurprised2() {
        let changeToNewTexture2 = SKAction.setTexture(SKTexture(imageNamed: "surprisedrgbgoose"))
        let waitDuration = 0.5
        let waitDuration2 = 1.0 // Change this to the desired wait time in seconds
        let waitAction = SKAction.wait(forDuration: waitDuration)
        let waitAction2 = SKAction.wait(forDuration: waitDuration2)
        let changeBackToOriginalTexture2 = SKAction.setTexture(SKTexture(imageNamed: "rgbgoose"))
        let gooseSurprised = SKAction.moveTo(y: frame.midY + 150, duration: 0.1)
        let gooseSurprised2 = SKAction.moveTo(y: frame.midY + 100, duration: 0.1)
        let sequence2 = SKAction.sequence([waitAction2, gooseSurprised, changeToNewTexture2, waitAction, changeBackToOriginalTexture2, gooseSurprised2])
        badSprite.run(sequence2)
    }
    
    override func update(_ currentTime: TimeInterval) {
        let duckHealthPercentage = CGFloat(duckHealth) / 100.0
        let scaleForward = SKAction.scale(to: 3, duration: 0.3)
        let scaleBackward2 = SKAction.scale(to: 2, duration: 0.2)
        let scaleSequence = SKAction.sequence([scaleForward, scaleBackward2])
        let moveRight = SKAction.moveTo(x: 900, duration: 0.5)
        let moveLeft = SKAction.moveTo(x: -900, duration: 0.5)
        let moveUp = SKAction.moveTo(y: frame.midY - 50, duration: 0.5)
        let moveDown = SKAction.moveTo(y: frame.midY - 75, duration: 0.5)
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


        if enemyHp <= 0 && !backButtonCreated {
            
            LevelSelectScene.level3Complete = true
            
            // Create textures for the button
            let normalTexture = SKTexture(imageNamed: "backButton")
            let selectedTexture = SKTexture(imageNamed: "backButtonSelected")
            
            // Remove other nodes from the scene
            turnLabel.removeFromParent()
            badSprite.removeFromParent()
            goodSprite.run(scaleSequence)
            goodSprite.run(moveUp)
            subtractButton.run(moveLeft)
            heavyButton.run(moveLeft)
            dodgeButton.run(moveRight)
            enemyHealthBar.removeFromParent()
            staminaBar.removeFromParent()
            duckHealthBar.removeFromParent()
            let scaleForward = SKAction.scale(to: 3, duration: 0.3)
            let scaleBackward2 = SKAction.scale(to: 2, duration: 0.2)
            let scaleSequence = SKAction.sequence([scaleForward, scaleBackward2])
            victory.size = CGSize(width: 300, height: 300)
            victory.position = CGPoint(x: frame.midX, y: frame.midY + 300)
            addChild(victory)
            victory.run(scaleSequence)
            gameIsActive = false
            
            // Create a custom back button
            let customBackButton = CustomBackButton(defaultTexture: normalTexture, selectedTexture: selectedTexture, size: CGSize(width: 250, height: 250))
            customBackButton.position = CGPoint(x: frame.midX, y: frame.midY - 1000)
            addChild(customBackButton)
            
            // Move the button into position
            let moveUp1 = SKAction.moveTo(y: frame.midY - 500, duration: 0.5)
            customBackButton.run(moveUp1)
            
            backButtonCreated = true // Set the flag to true
        } else if duckHealth <= 0 {
            gameIsActive = false
        }
        
        if duckHealth <= 0 && !backButtonCreated {
            goodSprite.removeFromParent()
            turnLabel.removeFromParent()
            badSprite.run(scaleSequence)
            badSprite.run(moveDown)
            subtractButton.run(moveLeft)
            heavyButton.run(moveLeft)
            dodgeButton.run(moveRight)
            enemyHealthBar.removeFromParent()
            staminaBar.removeFromParent()
            duckHealthBar.removeFromParent()
            let scaleForward = SKAction.scale(to: 3, duration: 0.3)
            let scaleBackward2 = SKAction.scale(to: 2, duration: 0.2)
            let scaleSequence = SKAction.sequence([scaleForward, scaleBackward2])
            defeat.size = CGSize(width: 300, height: 300)
            defeat.position = CGPoint(x: frame.midX, y: frame.midY + 300)
            addChild(defeat)
            defeat.run(scaleSequence)
            backButtonCreated = true
            
            let normalTexture = SKTexture(imageNamed: "backButton")
            let selectedTexture = SKTexture(imageNamed: "backButtonSelected")
            
            let customBackButton = CustomBackButton(defaultTexture: normalTexture, selectedTexture: selectedTexture, size: CGSize(width: 250, height: 250))
            customBackButton.position = CGPoint(x: frame.midX, y: frame.midY - 1000)
            addChild(customBackButton)
            
            // Move the button into position
            let moveUp1 = SKAction.moveTo(y: frame.midY - 500, duration: 0.5)
            customBackButton.run(moveUp1)
            backButtonCreated = true
            
            
        }
        
    }
    
    
    
}


