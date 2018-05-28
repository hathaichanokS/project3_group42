//
//  MathGame.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 20/5/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import GameKit

class MathGame : SKSpriteNode {
    
    private var level = 1 // need change when implemened game level
    private var mathEquation = MathEquation()
    
   func createEquationNode(scene : SKScene) -> SKLabelNode {
        let equationNode = SKLabelNode()
        mathEquation.equation = mathEquation.createEquation(level: level)
        var stringEquation = mathEquation.equation.joined(separator:" ")
        stringEquation += " = _"
        equationNode.text = stringEquation
        equationNode.position.y =  scene.frame.size.height * 0.45
        equationNode.position.x =  0
        equationNode.zPosition = 5
        return equationNode
    }
    
    func createEquation() -> String{
        var equation = ""
        mathEquation.equation = mathEquation.createEquation(level: level)
        equation = mathEquation.equation.joined(separator:" ")
        equation += " = _"
        return equation
    }
    
    
    func createAnswerNode(scene : SKScene) -> SKSpriteNode {
        let answerNode = SKSpriteNode()
        return answerNode
    } // working on it
    
    
}



