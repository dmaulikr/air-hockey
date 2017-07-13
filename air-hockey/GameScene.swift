//
//  GameScene.swift
//  air-hockey
//
//  Created by Masaya Hayashi on 2017/07/13.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var main = SKSpriteNode()
    var enemy = SKSpriteNode()
    var ball = SKSpriteNode()

    override func didMove(to view: SKView) {
        self.main = childNode(withName: "main") as! SKSpriteNode
        self.enemy = childNode(withName: "enemy") as! SKSpriteNode
        self.ball = childNode(withName: "ball") as! SKSpriteNode

        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border

        self.ball.physicsBody?.applyImpulse(CGVector(dx: -30, dy: -30))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        movePaddles(with: touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        movePaddles(with: touches)
    }

    private func movePaddles(with touches: Set<UITouch>) {
        for touch in touches {
            let location = touch.location(in: self)
            main.run(SKAction.moveTo(x: location.x, duration: 0.1))
        }
    }

    override func update(_ currentTime: TimeInterval) {
        enemy.run(SKAction.moveTo(x: self.ball.position.x, duration: 0.2))
    }

}
