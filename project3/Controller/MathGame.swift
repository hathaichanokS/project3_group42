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
        let stringEquation = mathEquation.equation.joined(separator:" ")
        equationNode.text = stringEquation
        equationNode.position.y =  scene.frame.size.height * 0.45
        equationNode.position.x =  0
        return equationNode
    }
    
    func createAnswerNode(scene : SKScene) -> SKSpriteNode {
        let answerNode = SKSpriteNode()
        return answerNode
    } // working on it
    
    
}



