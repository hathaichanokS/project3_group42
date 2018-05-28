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
    private var equation = MathGame()
    private let equationTime = 3
    private var equationLbl = SKLabelNode()
    
    override func didMove(to view: SKView) {
        loadEquationLabel()
        initializeGame()
    }
    
    
    private func initializeGame() {
        Timer.scheduledTimer(timeInterval: TimeInterval(equationTime), target: self, selector: #selector(MathGameScene.newEquation), userInfo: nil, repeats: true)
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
