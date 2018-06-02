//
//  MathGameScene.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 28/5/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import SpriteKit



class MathGameScene: SKScene {
    private let mathEquation = MathEquation()
    private let mathGame = MathGame()
    private let equationTime = 5
    private var equationLbl = SKLabelNode()
    private var level = 0
    private var answerLbls = [SKLabelNode]()
    private var scoreLbl = SKLabelNode()
    private var indexAnswer = 0
    private var score = 0
    
    private var gameTime = 30
    private var gameTimer = Timer()
    private var gameTimeLbl = SKLabelNode()
    private var playerInitialStatus = "happyPlayer"
    
    override func didMove(to view: SKView) {
        initializeGame()
        loadLabel()
        loadBalloon()
        addPlayer(status: playerInitialStatus)
        newEquation()
    }
    
    private func initializeGame() {
       Timer.scheduledTimer(timeInterval: TimeInterval(equationTime), target: self, selector: #selector(MathGameScene.newEquation), userInfo: nil, repeats: true)
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MathGameScene.countDown), userInfo: nil, repeats: true)
    }
    
    @objc private func loadBalloon() {
        let balloonNodes = mathGame.createBalloonNode(scene: self.scene!)
        for i in 0..<balloonNodes.count{
            self.scene?.addChild(balloonNodes[i]!)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let indx = String(indexAnswer)
        for touch in touches {
            let node = self.atPoint(touch.location(in: self))
            if node.name != "BGL1" {
                if node.name == "balloon" + indx || node.name == "answerLb" + indx {
                    score+=1
                    scoreLbl.text = String(score)
                    answerLbls[indexAnswer].alpha = 0.0
                    //change player
                    if let childNode = childNode(withName: "sadPlayer")  {
                        childNode.removeFromParent()
                        addPlayer(status: "happyPlayer")
                    }
                    else if let childNode = childNode(withName: "confusedPlayer"){
                        childNode.removeFromParent()
                        addPlayer(status: "happyPlayer")
                    }
                }
            
                else  {
                    //change player
                    if let childNode = childNode(withName: "happyPlayer"){
                        childNode.removeFromParent()
                        addPlayer(status: "confusedPlayer")
                    }
                    else if let childNode = childNode(withName: "confusedPlayer"){
                        childNode.removeFromParent()
                        addPlayer(status: "sadPlayer")
                    }
                }
            }
        }//end loop
    }
    
    @objc private func newEquation() {
        let newEquation = mathEquation.createEquation(level: 1)
        let stringEquation = newEquation.joined(separator:" ")
        equationLbl.text = stringEquation + " = _"
        let answers = mathEquation.createRandAnswer(equation: newEquation, level: level)
        var num = 0
        while num < 4{
            answerLbls[num].text = answers[num]
            answerLbls[num].alpha = 2.0
            num+=1
        }
        indexAnswer =  mathEquation.indexAnswer(equation: newEquation, answer: answers)
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
        if let scene = MathGameOverScene(fileNamed: "MathGameOver") {
        scene.scaleMode = .aspectFill
        view!.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(1)))
        }
    }
    
    private func addPlayer(status: String){
        let player =  mathGame.createPlayerNode(status:status, scene : self.scene!)
        self.scene?.addChild(player)
    }
    
    private func loadLabel() {
        equationLbl = self.childNode(withName: "equation") as! SKLabelNode
        equationLbl.position = CGPoint(x: 0 , y: 550 )
        equationLbl.fontSize = 270
        equationLbl.fontName = Asset.font
        var posx = (self.scene?.size.width)!/2 * -1  + 500
        posx.round(.up)
        var num = 0
        let answerLbl =  SKLabelNode()
        while num < 4 {
            answerLbls.append(answerLbl)
            answerLbls[num] = self.childNode(withName: "answerLb"+String(num)) as! SKLabelNode
            answerLbls[num].zPosition = 5
            answerLbls[num].position.y = 75
            answerLbls[num].position.x = posx + CGFloat(num*600)
            answerLbls[num].fontSize = 270
            answerLbls[num].fontName = Asset.font
            num+=1
        }
        scoreLbl = self.childNode(withName: "mathScore") as! SKLabelNode
        scoreLbl.position = CGPoint(x: (self.scene?.size.width)! / -2 + 300 , y: (self.scene?.size.height)! / 2 - 260 )
        scoreLbl.fontName = Asset.font
        scoreLbl.fontSize = 200
        scoreLbl.text = "0"
       
        gameTimeLbl = self.childNode(withName: "mathTimer") as! SKLabelNode
        gameTimeLbl.position = CGPoint(x: 1070 , y: 730 )
        gameTimeLbl.text = String(gameTime)
        gameTimeLbl.fontSize = 200
        gameTimeLbl.fontName = Asset.font
    }

}//end class
