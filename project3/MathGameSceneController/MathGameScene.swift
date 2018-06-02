//
//  MathGameScene.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 28/5/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import SpriteKit



class MathGameScene: SKScene {
    private var mathEquation = MathEquation()
    private var mathGame = MathGame()
    private let equationTime = 5
    private var equationLbl = SKLabelNode()
    private var level = 0
    private var answerLbls = [SKLabelNode]();
    
    override func didMove(to view: SKView) {
        initializeGame()
        loadLabel()
        loadBalloon()
    }
    
    private func initializeGame() {
        Timer.scheduledTimer(timeInterval: TimeInterval(equationTime), target: self, selector: #selector(MathGameScene.newEquation), userInfo: nil, repeats: true)
    }
    
    @objc private func loadBalloon() {
        let balloonNodes = mathGame.createBalloonNode(scene: self.scene!)
        for i in 0..<balloonNodes.count{
            self.scene?.addChild(balloonNodes[i]!)
        }
    }
    
    
    @objc private func newEquation() {
        let newEquation = mathEquation.createEquation(level: 1)
        let stringEquation = newEquation.joined(separator:" ")
        equationLbl.text = stringEquation + " = _"
        let answers = mathEquation.createRandAnswer(equation: newEquation, level: level)
        var num = 0
        while num < 4{
            answerLbls[num].text = answers[num]
            num+=1
        }
    }
    
    private func loadLabel() {
        equationLbl = self.childNode(withName: "equation") as! SKLabelNode
        equationLbl.position = CGPoint(x: 25 , y: 500 )
        var posx = (self.scene?.size.width)!/2 * -1  + 700
        posx.round(.up)
        var num = 0
        let answerLbl =  SKLabelNode()
        while num < 4 {
            answerLbls.append(answerLbl)
            answerLbls[num] = self.childNode(withName: "answerLb"+String(num+1)) as! SKLabelNode
            answerLbls[num].zPosition = 5
            answerLbls[num].position.y = 50
            answerLbls[num].position.x = posx + CGFloat(num*450)
            answerLbls[num].fontSize = 170
            num+=1
        }
    }
    


}
