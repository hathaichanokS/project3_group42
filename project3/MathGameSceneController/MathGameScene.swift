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
    private let equationTime = 10
    private var equationLbl = SKLabelNode()
    
    override func didMove(to view: SKView) {
        loadEquationLabel()
        initializeGame()
    }
    
    
    private func initializeGame() {
        Timer.scheduledTimer(timeInterval: TimeInterval(equationTime), target: self, selector: #selector(MathGameScene.newEquation), userInfo: nil, repeats: true)
        
         Timer.scheduledTimer(timeInterval: TimeInterval(equationTime), target: self, selector: #selector(MathGameScene.loadBalloon), userInfo: nil, repeats: true)
    }
    
    @objc private func loadBalloon() {
        let balloonNode = mathGame.createBalloonNode(scene: self.scene!)
        for i in 0..<balloonNode.count{
            self.scene?.addChild(balloonNode[i]!)
        }
       /* let answerLbl = mathGame.createAnswerLabel(scene: self.scene!, equation:  mathEquation.equation)
        for i in answerLbl{
            self.scene?.addChild(i!)
        }*/
    }
    
    
    @objc private func newEquation() {
        mathEquation.equation = mathEquation.createEquation(level: 1)
        var stringEquation = mathEquation.equation.joined(separator:" ")
        stringEquation += " = _"
        equationLbl.text = stringEquation
    }
    
    private func loadEquationLabel() {
        equationLbl = self.childNode(withName: "equation") as! SKLabelNode
        equationLbl.position = CGPoint(x: 25 , y: 500 )
    }
    
    private func loadAnswer(){
        
    }

}
