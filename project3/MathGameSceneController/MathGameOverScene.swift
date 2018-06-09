//
//  MathGameOver.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 2/6/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import SpriteKit



class MathGameOverScene: SKScene {
    
    override func didMove(to view: SKView) {
        initializeGame()
       
    }
    private func initializeGame() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "replayB" {
                if let scene = MathLevelScene(fileNamed: "MathLevel") {
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration:TimeInterval(1)))
                }
            }  else if atPoint(location).name == "homeB" {
                if let scene = MainGameScene(fileNamed: "MainGame") {
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration:TimeInterval(1)))
                }
            }
          
        }//end loop
    }
 
}//end class
