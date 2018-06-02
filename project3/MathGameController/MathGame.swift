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
            balloonNode[size] = SKSpriteNode(imageNamed: "balloon")
            balloonNode[size]?.zPosition = 2
            balloonNode[size]?.position.y = 0
            balloonNode[size]?.position.x = posx + CGFloat(size*450)
            size += 1
        }
        return balloonNode
    }

    
}



