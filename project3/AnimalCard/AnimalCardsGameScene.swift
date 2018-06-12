//
//  AnimalCardsGameScene.swift
//  AnimalCards
//
//  Created by Zihui Lu on 12/6/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import SpriteKit

class AnimalCardsGameScene: SKScene {
    
    private var scoreLbl = SKLabelNode()
    private var score = 0
    
    private var gameTime = 30
    private var gameTimer = Timer()
    private var gameTimeLbl = SKLabelNode()
    
    override func didMove(to view: SKView) {
        initializeGame()
        loadLabel()
    }
    
    private func initializeGame() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(AnimalCardsGameScene.countDown), userInfo: nil, repeats: true)
        
        
        
    }
    
    
    @objc func countDown() {
        gameTime-=1
        gameTimeLbl.text = String(gameTime)
        if gameTime == 0 {
            gameTimer.invalidate()
            gameOver()
        }
    }
    
    private func gameOver(){
        if let scene = AnimalCardsGameOverScene(fileNamed: "AnimalCardsGameOver") {
            scene.scaleMode = .aspectFill
            view!.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(1)))
        }
    }
    
    
    
    private func loadLabel() {
        scoreLbl = self.childNode(withName: "AnimalScore") as! SKLabelNode
        scoreLbl.text = "0"
        
        gameTimeLbl = self.childNode(withName: "AnimalTimer") as! SKLabelNode
        gameTimeLbl.text = String(gameTime)

        
    }
    
}
