//
//  MainGameScene.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 28/5/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//


import SpriteKit



class MainGameScene: SKScene {
    
    private var mathPopBtn = SKSpriteNode()
    private var animalCardBtn = SKSpriteNode()
    private var spaceSpellBtn = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "mathPop" {
                if let scene = MathLevelScene(fileNamed: "MathLevel") {
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition: SKTransition.doorway(withDuration:TimeInterval(0.03)))
                }
            }
            
            if atPoint(location).name == "animalCard" {
                if let scene = AnimalCardsLevelScene(fileNamed: "AnimalCardsLevel") {
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition: SKTransition.doorway(withDuration:TimeInterval(0.03)))
                }
            }
            
            if atPoint(location).name == "spaceSpell" {
                if let scene = SpaceSpellLevelScene(fileNamed: "SpaceSpellLevel") {
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition: SKTransition.doorway(withDuration:TimeInterval(0.03)))
                }
            }
        }//end loop
    }//end function
    
    private func loadGameBtn(){
        mathPopBtn = self.childNode(withName: "mathPop") as! SKSpriteNode
        mathPopBtn.position = CGPoint(x:-794, y:-158 )
        animalCardBtn = self.childNode(withName: "animalCard") as! SKSpriteNode
        animalCardBtn.position = CGPoint(x:-1, y:-158 )
        spaceSpellBtn = self.childNode(withName: "spaceSpell") as! SKSpriteNode
        spaceSpellBtn.position = CGPoint(x:794, y:-158 )
    }

}
