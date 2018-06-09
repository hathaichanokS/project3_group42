//
//  MathGameController.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 9/6/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import GameKit

class MathGameController : SKSpriteNode {
    
    func createBalloonNode(scene : SKScene) -> [SKSpriteNode?] {
        var posx = scene.size.width/2 * -1  + 500
        posx.round(.up)
        var balloonNode = [SKSpriteNode?](repeating: nil, count: 4)
        var count = 0
        while count < 4 {
            balloonNode[count] = SKSpriteNode(imageNamed: Asset.balloon+String(count))
            balloonNode[count]?.name = "balloon" + String(count)
            balloonNode[count]?.setScale(1.5)
            balloonNode[count]?.zPosition = 2
            balloonNode[count]?.position.y = 0
            balloonNode[count]?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            balloonNode[count]?.position.x = posx + CGFloat(count*600)
            count += 1
        }
        return balloonNode
    }
    
    func createPlayerNode(status: String, scene : SKScene) -> SKSpriteNode {
        var player = SKSpriteNode()
        player = SKSpriteNode(imageNamed: Asset.player[status]!)
        player.name = status
        player.zPosition = 2
        player.setScale(0.3)
        player.position.y = -600
        player.position.x = 25
        return player
    }
    
    
}

