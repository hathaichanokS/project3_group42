//
//  SpaceSpellController.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 9/6/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import GameKit

class SpaceSpellController : SKSpriteNode {
    
    func createQuestionNode(scene : SKScene, question: [Character]) -> [SKSpriteNode?] {
        var posx = scene.size.width/4 * -1  + 280
        posx.round(.up)
        var questionNode = [SKSpriteNode?](repeating: nil, count: question.count)
        var count = 0
        let questions = question
        while count < question.count {
            questionNode[count] = SKSpriteNode(imageNamed: String(questions[count]))
            questionNode[count]?.name = String(questions[count])
            questionNode[count]?.setScale(0.15)
            questionNode[count]?.zPosition = 3
            if questions[count] == "-"{
                 questionNode[count]?.position.y = 100
            }else{
                 questionNode[count]?.position.y = 40
            }
           
            questionNode[count]?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            questionNode[count]?.position.x = posx + CGFloat(count*400)
            count += 1
        }

        return questionNode
    }
    
    func createAnswerNode(scene : SKScene, answer: [Character]) -> [SKSpriteNode?] {
        var posx = scene.size.width/4 * -1  + 150
        posx.round(.up)
        var answersNode = [SKSpriteNode?](repeating: nil, count: answer.count)
        var count = 0
        
        while count < answer.count {
            answersNode[count] = SKSpriteNode(imageNamed: String(answer[count]))
            answersNode[count]?.name = String(answer[count])
            answersNode[count]?.setScale(0.15)
            answersNode[count]?.zPosition = 3
            answersNode[count]?.position.y = -500
            answersNode[count]?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            answersNode[count]?.position.x = posx + CGFloat(count*400)
            count += 1
        }
        
        return answersNode
        
    }
    

}//end class
