//
//  FirstButton.swift
//  Duck
//
//  Created by Caden Christesen on 4/17/24.
//

import SpriteKit
import GameplayKit


class button: SKSpriteNode {
    
}
class FirstButton: SKSpriteNode {
    
    var defaultTexture: SKTexture
    var selectedTexture: SKTexture
    
    init(defaultTexture: SKTexture, selectedTexture: SKTexture, size: CGSize) {
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        super.init(texture: defaultTexture, color: UIColor.clear, size: size)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.5
        self.texture = selectedTexture
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1.0
        self.texture = defaultTexture
        let transition = SKTransition.fade(withDuration: 2.5)
        if let scene = SKScene(fileNamed: "LevelSelectScene") {
            scene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scene, transition: transition)
        }
    }
}

////////////


class Level1Button: SKSpriteNode {
    
    var defaultTexture: SKTexture
    var selectedTexture: SKTexture
    
    init(defaultTexture: SKTexture, selectedTexture: SKTexture, size: CGSize) {
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        super.init(texture: defaultTexture, color: UIColor.clear, size: size)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.5
        self.texture = selectedTexture
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1.0
        self.texture = defaultTexture
        let transition = SKTransition.fade(withDuration: 2.5)
        if let scene = SKScene(fileNamed: "DuckSelectScene1") {
            scene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scene, transition: transition)
        }
    }
}
class Level2Button: SKSpriteNode {
    
    var defaultTexture: SKTexture
    var selectedTexture: SKTexture
    
    init(defaultTexture: SKTexture, selectedTexture: SKTexture, size: CGSize) {
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        super.init(texture: defaultTexture, color: UIColor.clear, size: size)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.5
        self.texture = selectedTexture
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1.0
        self.texture = defaultTexture
        let transition = SKTransition.fade(withDuration: 2.5)
        if let scene = SKScene(fileNamed: "DuckSelectScene2") {
            scene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scene, transition: transition)
        }
    }
}
class Level3Button: SKSpriteNode {
    
    var defaultTexture: SKTexture
    var selectedTexture: SKTexture
    
    init(defaultTexture: SKTexture, selectedTexture: SKTexture, size: CGSize) {
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        super.init(texture: defaultTexture, color: UIColor.clear, size: size)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.5
        self.texture = selectedTexture
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1.0
        self.texture = defaultTexture
        let transition = SKTransition.fade(withDuration: 2.5)
        if let scene = SKScene(fileNamed: "DuckSelectScene3") {
            scene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scene, transition: transition)
        }
    }
}


//////////////


class Duck1Button: SKSpriteNode {
    
    var defaultTexture: SKTexture
    var selectedTexture: SKTexture
    
    init(defaultTexture: SKTexture, selectedTexture: SKTexture, size: CGSize) {
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        super.init(texture: defaultTexture, color: UIColor.clear, size: size)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.5
        self.texture = selectedTexture
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1.0
        self.texture = defaultTexture
        let transition = SKTransition.fade(withDuration: 2.5)
        if let scene = SKScene(fileNamed: "Level1Scene") {
            scene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scene, transition: transition)
        }
    }
}
class Duck2Button: SKSpriteNode {
    
    var defaultTexture: SKTexture
    var selectedTexture: SKTexture
    
    init(defaultTexture: SKTexture, selectedTexture: SKTexture, size: CGSize) {
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        super.init(texture: defaultTexture, color: UIColor.clear, size: size)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.5
        self.texture = selectedTexture
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1.0
        self.texture = defaultTexture
        let transition = SKTransition.fade(withDuration: 2.5)
        if let scene = SKScene(fileNamed: "Level2Scene") {
            scene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scene, transition: transition)
        }
    }
}
class Duck3Button: SKSpriteNode {
    
    var defaultTexture: SKTexture
    var selectedTexture: SKTexture
    
    init(defaultTexture: SKTexture, selectedTexture: SKTexture, size: CGSize) {
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        super.init(texture: defaultTexture, color: UIColor.clear, size: size)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.5
        self.texture = selectedTexture
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1.0
        self.texture = defaultTexture
        let transition = SKTransition.fade(withDuration: 2.5)
        if let scene = SKScene(fileNamed: "Level3Scene") {
            scene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scene, transition: transition)
        }
    }
}


//////////////





class ThirdButton: SKSpriteNode {
    
    var defaultTexture: SKTexture
    var selectedTexture: SKTexture
    
    init(defaultTexture: SKTexture, selectedTexture: SKTexture, size: CGSize) {
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        super.init(texture: defaultTexture, color: UIColor.clear, size: size)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.5
        self.texture = selectedTexture
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1.0
        self.texture = defaultTexture
        let transition = SKTransition.fade(withDuration: 2.5)
        if let scene = SKScene(fileNamed: "LevelScene") {
            scene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scene, transition: transition)
        }
    }
}
