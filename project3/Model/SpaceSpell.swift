//
//  SpaceSpell.swift
//  Space Spell
//
//  Created by Zihui Lu on 5/6/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import Foundation

struct SpaceSpell {
    
    let letters = "abcdefghijklmnopqrstuvwxyz"
    var chances = 5
    var duration = 30
    var score = 0
    var words: [String] = []
    var question = ""
    var QuestionChars : [Character] = []
    var correctAnswer : Character = " "
    var choices: [Character] = []
    
    
    mutating func setup() {
        let randomQuestionIndex = Int(arc4random_uniform(UInt32(words.count)))
        question = words[randomQuestionIndex]
        QuestionChars = Array(question)
        let randomCharacterIndex = Int(arc4random_uniform(UInt32(QuestionChars.count)))
        correctAnswer = QuestionChars[randomCharacterIndex]
        QuestionChars[randomCharacterIndex] = "_"
        var tempChoices: [Character] = []
        tempChoices.append(correctAnswer)
        let lettersArr = Array(letters)
        for _ in 0...2 {
            let randomLetterIndex = Int(arc4random_uniform(UInt32(lettersArr.count)))
            tempChoices.append(lettersArr[randomLetterIndex])
        }
        
        choices = shuffleCharacterArray(arr: tempChoices)
    }
    
    mutating func choose(choice : Character) -> Bool {
        if choice == correctAnswer {
            score += 1
            return true
        } else {
            chances -= 1
            return false
        }
    }
    
    
    
    
    func shuffleArray(arr:[String]) -> [String] {
        var data:[String] = arr
        for i in 1..<arr.count {
            let index:Int = Int(arc4random()) % i
            if index != i {
                data.swapAt(i, index)
            }
        }
        return data
    }
    
    func shuffleCharacterArray(arr:[Character]) -> [Character] {
        var data:[Character] = arr
        for i in 1..<arr.count {
            let index:Int = Int(arc4random()) % i
            if index != i {
                data.swapAt(i, index)
            }
        }
        return data
    }
    
    
    
    
    
    
    init(level : Int) {
        if level == 1 {
            words = ["cat","rat","fox","hen","dog","pig","pen","cow"]
        } else if level == 2 {
            words = ["Cat","job","fix","jam","dog","pig","key","cow"]
        } else if level == 3 {
            words = ["Cat","job","fix","jam","dog","pig","key","cow"]
        } else if level == 4 {
            words = ["Cat","job","fix","jam","dog","pig","key","cow"]
        } else if level == 5 {
            words = ["Cat","job","fix","jam","dog","pig","key","cow"]
        }
        
        setup()
    }
}
