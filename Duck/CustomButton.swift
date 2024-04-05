//
//  CustomButton.swift
//  Duck
//
//  Created by Josh Madison on 3/21/24.
//

import SpriteKit
import GameplayKit

class CustomButton: SKSpriteNode {
    
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
        if let scene = SKScene(fileNamed: "GameScene2") {
            scene.scaleMode = .aspectFill
            self.scene?.view?.presentScene(scene, transition: transition)
        }
    }
}
