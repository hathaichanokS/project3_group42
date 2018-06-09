//
//  SpaceSpellScene.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 9/6/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

//
//  MainGameScene.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 28/5/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//


import SpriteKit

class SpaceSpellScene: SKScene {
    private var spaceGame = SpaceSpellController()
    private var scoreLbl = SKLabelNode()
    private var score = 0
    
    private var gameTime = 30
    private var gameTimer = Timer()
    private var gameTimeLbl = SKLabelNode()
    
    private var wordNodes = [SKSpriteNode]()
    private var answerNodes = [SKSpriteNode]()
    private var correctAns:String = " "
    override func didMove(to view: SKView) {
       initializeGame()
       loadLabel()
       loadWords()
    }
    
    private func initializeGame() {
         gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MathGameScene.countDown), userInfo: nil, repeats: true)
        
         Timer.scheduledTimer(timeInterval: TimeInterval(8), target: self, selector: #selector(SpaceSpellScene.loadWords), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(7), target: self, selector: #selector(SpaceSpellScene.removeWordsNode), userInfo: nil, repeats: true)
        
        
    }
    
    @objc private func loadWords() {
        let words = SpaceSpell(level: 1)
        correctAns = String(words.correctAnswer)
        wordNodes = spaceGame.createQuestionNode(scene: self.scene!, question : words.QuestionChars) as! [SKSpriteNode]
        for i in 0..<wordNodes.count{
            self.scene?.addChild(wordNodes[i])
        }
        
        answerNodes = spaceGame.createAnswerNode(scene: self.scene!, answer : words.choices) as! [SKSpriteNode]
        for i in 0..<answerNodes.count{
            self.scene?.addChild(answerNodes[i])
        }
    }
    
    @objc private func removeWordsNode(){
        for i in 0..<wordNodes.count{
            wordNodes[i].removeFromParent()
        }
        for i in 0..<answerNodes.count{
            answerNodes[i].removeFromParent()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let node = self.atPoint(touch.location(in: self))
            if node.name != "SpaceBGL1" {
                if node.name == correctAns {
                    score+=1
                    scoreLbl.text = String(score)
                    node.removeFromParent()
                }
                
            }
        }//end loop
       
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
        if let scene = SpaceSpellGameOverScene(fileNamed: "SpaceSpellGameOver") {
            scene.scaleMode = .aspectFill
            view!.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(1)))
        }
    }
    
    
    
    private func loadLabel() {
        scoreLbl = self.childNode(withName: "score") as! SKLabelNode
        scoreLbl.position = CGPoint(x: (self.scene?.size.width)! / -2 + 300 , y: (self.scene?.size.height)! / 2 - 260 )
        scoreLbl.fontName = Asset.font
        scoreLbl.fontSize = 200
        scoreLbl.text = "0"
        
        gameTimeLbl = self.childNode(withName: "timer") as! SKLabelNode
        gameTimeLbl.position = CGPoint(x: 1070 , y: 730 )
        gameTimeLbl.text = String(gameTime)
        gameTimeLbl.fontSize = 200
        gameTimeLbl.fontName = Asset.font
        
    }
    
    
    
}

