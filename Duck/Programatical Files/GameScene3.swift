//
//  GameScene3.swift
//  Duck
//
//  Created by Caden Christesen on 4/10/24.
//

import SpriteKit

class GameScene3: SKScene {
    
    // State variables
    var selectedDuck1: String = "Original"
    var selectedDuck2: String = "Original"
    var selectedDuck3: String = "Original"
    var duckSelection1 = "Original"
    var duckSelection2 = "Original"
    var duckSelection3 = "Original"
    var attackTurn: Int = 0
    let duckTypes = ["Original", "Fire", "Water", "Earth", "Ice"]
    var hp1: CGFloat = 100.0
    var hp2: CGFloat = 100.0
    var hp3: CGFloat = 100.0
    var hp1Total: CGFloat = 100.0
    var hp2Total: CGFloat = 100.0
    var hp3Total: CGFloat = 100.0
    var dmg1: CGFloat = 50.0
    var dmg2: CGFloat = 50.0
    var dmg3: CGFloat = 50.0
    var dmg1Total: CGFloat = 50.0
    var dmg2Total: CGFloat = 50.0
    var dmg3Total: CGFloat = 50.0
    var enemyHp: CGFloat = 500.0
    var enemyDmg: CGFloat = 50.0
    var enemyHpTotal: CGFloat = 500.0
    var enemyDmgTotal: CGFloat = 50.0
    var playerTurn = "Goose"
    
    override func didMove(to view: SKView) {
        createBackground()
        createLabel()
        createGoose()
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
        // Example of adding a label
        let turnLabel = SKLabelNode(fontNamed: "Verdana-Bold")
        turnLabel.text = "Turn: \(playerTurn)"
        turnLabel.fontSize = 24
        turnLabel.fontColor = .black
        turnLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 300)
        addChild(turnLabel)
    }
    
    func createGoose(){
        // Example of adding an image
        let badSprite = SKSpriteNode(imageNamed: "goose")
        badSprite.size = CGSize(width: 200, height: 200)
        badSprite.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(badSprite)
    }
    func createAtkButton() {
        // Add your buttons and other UI elements as SKNodes
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Handle touch events if needed
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Update your game logic here
    }
}
