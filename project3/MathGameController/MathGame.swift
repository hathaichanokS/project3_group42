//
//  MathGame.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 20/5/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import GameKit

class MathGame : SKSpriteNode {
    
    func createBalloonNode(scene : SKScene) -> [SKSpriteNode?] {
        var posx = scene.size.width/2 * -1  + 700
        posx.round(.up)
        var balloonNode = [SKSpriteNode?](repeating: nil, count: 4)
        var size = 0
        while size < 4 {
            balloonNode[size] = SKSpriteNode(imageNamed: Asset.balloon+String(size))
            balloonNode[size]?.zPosition = 2
            balloonNode[size]?.position.y = 0
            balloonNode[size]?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            balloonNode[size]?.position.x = posx + CGFloat(size*450)
            size += 1
        }
        return balloonNode
    }
    
    func createPlayerNode(status: String, scene : SKScene) -> SKSpriteNode {
        var player = SKSpriteNode()
        player = SKSpriteNode(imageNamed: Asset.player[status]!)
        player.zPosition = 2
        player.setScale(0.3)
        player.position.y = -600
        player.position.x = 25
        return player
    }
    
    
}



