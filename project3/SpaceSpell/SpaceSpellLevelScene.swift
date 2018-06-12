//
//  SpaceSpellLevelScene.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 9/6/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

//

import SpriteKit

class SpaceSpellLevelScene: SKScene {
    
    private var presentTimer = Timer()
    private var nextSceneTime: Int = 2
    private var level = Level()
    
    
    override func didMove(to view: SKView) {
        initializeGame()
        level.getUserDefault()
    }
    
    private func initializeGame() {
        presentTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(SpaceSpellLevelScene.countDown), userInfo: nil, repeats: true)
    }
    
    //count down for next scene
    @objc func countDown() {
        nextSceneTime-=1
        if nextSceneTime == 0 {
            presentTimer.invalidate()
            nextScene()
        }
    }
    
    private func nextScene() {
        if let scene = SpaceSpellScene(fileNamed: "SpaceGame") {
            scene.scaleMode = .aspectFill
            view!.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(0.3)))
        }
    }
    
}//end class

