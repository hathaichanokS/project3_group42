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
    private var font = Font()
    
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
    
    func createBalloonNode(scene : SKScene) -> [SKSpriteNode?] {
        var posx = scene.size.width/2 * -1  + 600
        posx.round(.up)
        var balloonNode = [SKSpriteNode?](repeating: nil, count: 4)
        var size = 0
        while size < 4 {
            balloonNode[size] = SKSpriteNode(imageNamed: "balloon")
            balloonNode[size]?.zPosition = 2
            balloonNode[size]?.position.y =  0
            balloonNode[size]?.position.x = posx + CGFloat(size*450)
            size += 1
        }
        return balloonNode
    } // working on it
    
    func createAnswerLabel(scene : SKScene, equation: [String]) -> [SKLabelNode?]  {
        let answerLblNode = [SKLabelNode?](repeating: nil, count: 4)
       /* var posx = scene.size.width/2 * -1  + 600
        posx.round(.up)
        let answer = mathEquation.createAnswer(equation: equation)
        let randAnswer = mathEquation.createRandAnswer(equation: equation, level: level)
        
        var size = 0
        while size < 4 {
            answerLblNode[size]?.zPosition = 3
            answerLblNode[size]?.position.y =  0
            answerLblNode[size]?.position.x = posx + CGFloat(size*450)
            answerLblNode[size]?.fontSize = 100
            if size == 0 {
                answerLblNode[size]?.text = answer
            }
            else {
                answerLblNode[size]?.text = randAnswer[size-1]
            }
            size += 1
        }
        /*
        let answerLblNode = SKLabelNode()
        let answer = mathEquation.createAnswer(equation: equation)
        answerLblNode.text = answer
        answerLblNode.zPosition = 3
        answerLblNode.position.y =  scene.size.height/2 - 300
        answerLblNode.position.x = scene.size.width/2 * -1  + 500*/  */
        return answerLblNode
 
    }
    
  
    
    
}



