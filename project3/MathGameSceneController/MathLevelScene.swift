//
//  MathLevelScene.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 28/5/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import SpriteKit



class MathLevelScene: SKScene {
    
    private var presentTimer = Timer()
    private var nextSceneTime: Int = 4
    
    override func didMove(to view: SKView) {
        initializeGame()
    }
    
    private func initializeGame() {
        presentTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MathLevelScene.countDown), userInfo: nil, repeats: true)
    }
    
    @objc func countDown() {
        nextSceneTime-=1
        if nextSceneTime == 0 {
            presentTimer.invalidate()
            nextScene()
        }
    }
    
    private func nextScene() {
        if let scene = MathGameScene(fileNamed: "MathGame") {
            scene.scaleMode = .aspectFill
            view!.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(1)))
        }
    }
    
}//end class
