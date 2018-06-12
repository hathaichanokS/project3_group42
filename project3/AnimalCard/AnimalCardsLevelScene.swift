//
//  AnimalCardsLevelScene.swift
//  AnimalCards
//
//  Created by Zihui Lu on 12/6/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import SpriteKit

class AnimalCardsLevelScene: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "level 1"{

                if let scene = AnimalCardsGameScene(fileNamed: "AnimalCardsGame") {
                    scene.scaleMode = .aspectFill
                    
                    view!.presentScene(scene,transition:SKTransition.doorsOpenVertical(withDuration: TimeInterval(2)))
                }
                
            }
        }

    }

}
