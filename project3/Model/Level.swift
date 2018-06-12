//
//  Level.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 12/6/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import Foundation
struct Level {
    static var mathLevel = [String]()
    static var spaceSpellLevel = [String]()
    static var animalCardLevel = [String]()
    let user = UserDefaults.standard
    
    func setUserDefault() {
        if !(Level.mathLevel.isEmpty) {
            UserDefaults.standard.set(Level.mathLevel, forKey: "mathLevel")
            UserDefaults.standard.synchronize()
        }
        if !(Level.spaceSpellLevel.isEmpty) {
            UserDefaults.standard.set(Level.spaceSpellLevel, forKey: "spaceSpellLevel")
            UserDefaults.standard.synchronize()
        }
        if !(Level.animalCardLevel.isEmpty) {
            UserDefaults.standard.set(Level.animalCardLevel, forKey: "animalCardLevel")
            UserDefaults.standard.synchronize()
        }
    }
    
    func getUserDefault() {
        if UserDefaults.standard.array(forKey: "mathLevel") != nil {
            Level.mathLevel = UserDefaults.standard.array(forKey: "mathLevel") as! [String]
        }
        if UserDefaults.standard.array(forKey: "spaceSpellLevel") != nil {
            Level.spaceSpellLevel = UserDefaults.standard.array(forKey: "spaceSpellLevel") as! [String]
        }
        if UserDefaults.standard.array(forKey: "animalCardLevel") != nil {
            Level.animalCardLevel = UserDefaults.standard.array(forKey: "animalCardLevel") as! [String]
        }
    }
    
    func getmathLevel() -> Int {
        if let level = Level.mathLevel.first {
            return Int(level)!
        }else {
            return 1
        }
    }
    
    func getSpaceSpellLevel() -> Int {
        if let level = Level.spaceSpellLevel.first {
            return Int(level)!
        }else {
            return 1
        }
    }
    
    func getAnimalCardLevel() -> Int {
        if let level = Level.animalCardLevel.first {
            return Int(level)!
        }else {
            return 1
        }
    }
    
    
    
}//end struct







