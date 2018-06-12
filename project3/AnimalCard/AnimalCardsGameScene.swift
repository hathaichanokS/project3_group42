//
//  AnimalCardsGameScene.swift
//  AnimalCards
//
//  Created by Zihui Lu on 12/6/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import SpriteKit

class AnimalCardsGameScene: SKScene {
    
    
    private var cards = [SKSpriteNode]()
    private var ShownCards = [SKSpriteNode]()
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
        
        cards.append((childNode(withName: "cat1") as! SKSpriteNode?)!)
        cards.append((childNode(withName: "cat2") as! SKSpriteNode?)!)
        cards.append((childNode(withName: "dog1") as! SKSpriteNode?)!)
        cards.append((childNode(withName: "dog2") as! SKSpriteNode?)!)
        cards.append((childNode(withName: "bluebird1") as! SKSpriteNode?)!)
        cards.append((childNode(withName: "bluebird2") as! SKSpriteNode?)!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "cat1" {
                self.cards[0].texture = SKTexture.init(imageNamed: "cat card")
            } else if atPoint(location).name == "cat2" {
                self.cards[1].texture = SKTexture.init(imageNamed: "cat card")
            } else if atPoint(location).name == "dog1" {
                self.cards[2].texture = SKTexture.init(imageNamed: "dog card")
            } else if atPoint(location).name == "dog2" {
                self.cards[3].texture = SKTexture.init(imageNamed: "dog card")
            } else if atPoint(location).name == "bluebird1" {
                self.cards[4].texture = SKTexture.init(imageNamed: "bluebird card")
            } else if atPoint(location).name == "bluebird2" {
                self.cards[5].texture = SKTexture.init(imageNamed: "bluebird card")
            }
        }
        
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
