import SpriteKit

class DuckSelectScene1: SKScene {
    
    var currentIndex = 0
    var duckSprites: [SKSpriteNode] = []
    var ogDuck: SKSpriteNode!
    var fireDuck: SKSpriteNode!
    var earthDuck: SKSpriteNode!
    var selectionArrowLeft: SKSpriteNode!
    var selectionArrowRight: SKSpriteNode!
    var currentSelectedDuck = ""
    var BasicDuckArray = ["Original", "Fire", "Earth"]

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
        chooseADuck.size = CGSize(width: 130, height: 130) // Increase size
        chooseADuck.zPosition = -2
        addChild(chooseADuck)
        let scaleBackward = SKAction.scale(to: 0.25, duration: 0.2)
        let scaleForward = SKAction.scale(to: 6, duration: 0.3)
        let scaleBackward2 = SKAction.scale(to: 5, duration: 0.2)
        let scaleSequence = SKAction.sequence([scaleForward, scaleBackward2])
        chooseADuck.run(scaleSequence)
        
        ogDuck = createDuck(texture: SKTexture(imageNamed: "Original"), position: CGPoint(x: frame.midX, y: frame.midY))
        fireDuck = createDuck(texture: SKTexture(imageNamed: "Fire"), position: CGPoint(x: frame.midX, y: frame.midY))
        earthDuck = createDuck(texture: SKTexture(imageNamed: "Earth"), position: CGPoint(x: frame.midX, y: frame.midY))
        
        duckSprites = [ogDuck, fireDuck, earthDuck]
    }
    
    func createDuck(texture: SKTexture, position: CGPoint) -> SKSpriteNode {
        let duck = SKSpriteNode(texture: texture, size: CGSize(width: 60, height: 40))
        duck.position = position
        duck.size = CGSize(width: 50.0, height: 50.0)
        addChild(duck)
        
        let scaleForward = SKAction.scale(to: 6, duration: 0.3)
        let scaleBackward2 = SKAction.scale(to: 5, duration: 0.2)
        let scaleSequence = SKAction.sequence([scaleForward, scaleBackward2])
        duck.run(scaleSequence)
        return duck
    }
    
    func createButtons() {


                
        let arrowSize = CGSize(width: 300, height: 300) // Increase size
        
        let arrowLeft = SKTexture(imageNamed: "selectionArrow")
        selectionArrowLeft = SKSpriteNode(texture: arrowLeft)
        selectionArrowLeft.name = "selectionArrowLeft"
        selectionArrowLeft.position = CGPoint(x: frame.midX - 150, y: frame.midY)
        selectionArrowLeft.size = arrowSize
        addChild(selectionArrowLeft)
        
        let arrowRight = SKTexture(imageNamed: "selectionArrow")
        selectionArrowRight = SKSpriteNode(texture: arrowRight)
        selectionArrowRight.name = "selectionArrowRight"
        selectionArrowRight.position = CGPoint(x: frame.midX + 150, y: frame.midY)
        selectionArrowRight.size = arrowSize
        selectionArrowRight.xScale = -1
        selectionArrowRight.yScale = -1
        addChild(selectionArrowRight)
        
        
        let normalTexture2 = SKTexture(imageNamed: "SelectButton")

        let selectedTexture2 = SKTexture(imageNamed: "SelectButtonSelected")
        
        
        let selectButton = Duck1Button(defaultTexture: normalTexture2, selectedTexture: selectedTexture2, size: CGSize(width: 250, height: 250))
        selectButton.position = CGPoint(x: frame.midX, y: frame.midY - 900)
        selectButton.zPosition = -1
        addChild(selectButton)
        let moveUp = SKAction.moveTo(y: frame.midY - 525, duration: 0.5)
        selectButton.run(moveUp)
        
        
        let normalTexture1 = SKTexture(imageNamed: "ActualBackButton")
        let selectedTexture1 = SKTexture(imageNamed: "ActualBackButton")
        let customBackButton = CustomBackButton(defaultTexture: normalTexture1, selectedTexture: selectedTexture1, size: CGSize(width: 250, height: 250))
        customBackButton.position = CGPoint(x: frame.midX - 200, y: frame.midY + 1000)
        customBackButton.zPosition = -1
        addChild(customBackButton)
        let moveUp1 = SKAction.moveTo(y: frame.midY + 550, duration: 0.5)
        customBackButton.run(moveUp1)
        
        


        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "selectionArrowRight" {
                currentIndex = (currentIndex + 1) % duckSprites.count
                let growAction = SKAction.scale(to: -1.2, duration: 0.1)
                                let shrinkAction = SKAction.scale(to: -1.0, duration: 0.1)
                                let sequence = SKAction.sequence([growAction, shrinkAction])
                selectionArrowRight.run(sequence)
                updateDisplayedDuck()
            } else if touchedNode.name == "selectionArrowLeft" {
                currentIndex = (currentIndex - 1 + duckSprites.count) % duckSprites.count
                let growAction = SKAction.scale(to: 1.2, duration: 0.1)
                                let shrinkAction = SKAction.scale(to: 1.0, duration: 0.1)
                                let sequence = SKAction.sequence([growAction, shrinkAction])
                selectionArrowLeft.run(sequence)
                updateDisplayedDuck()
            }
        }
    }
    
    func updateDisplayedDuck() {
        for duck in duckSprites {
            duck.isHidden = true
        }
        duckSprites[currentIndex].isHidden = false
        
        TitleScene.Duck = BasicDuckArray[currentIndex]

    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Update code here
    }
}

