//
//  LaunchGameScene.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 28/5/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//


import SpriteKit



class LaunchGameScene: SKScene {
    override func didMove(to view: SKView) {
        if let scene = MainGameScene(fileNamed: "MainGame") {
            scene.scaleMode = .aspectFill
            view.presentScene(scene, transition: SKTransition.fade(withDuration: TimeInterval(10)))
        }
    }
    
    
}
