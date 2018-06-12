//
//  AnimalCardGameOverScene.swift
//  project3
//
//  Created by Zihui Lu on 12/6/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import SpriteKit

class AnimalCardsGameOverScene: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "animalReplay" {
                if let scene = AnimalCardsGameScene(fileNamed: "AnimalCardsGame") {
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration:TimeInterval(1)))
                }
            }  else if atPoint(location).name == "home" {
                if let scene = MainGameScene(fileNamed: "MainGame") {
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration:TimeInterval(1)))
                }
            }
            
        }
    }
    
}
