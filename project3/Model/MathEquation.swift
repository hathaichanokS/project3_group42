//
//  Equation.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 20/5/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import GameKit


struct MathEquation {
    
    var equation = [String]()
    let randomNumber: GKRandomSource = GKARC4RandomSource()
    
    func createEquation(level:Int) -> [String] {
        var equation = [String]()
        equation.append(createLeftOperand(level: level))
        equation.append(createOperator())
        equation.append(createRightOperand(level: level))
        return equation
    }
    
    func createAnswer(equation: [String]) -> String {
        switch equation[1] {
            case "-":
                return String(Int(equation[0])! - Int(equation[2])!)
            case "+":
                return String(Int(equation[0])! + Int(equation[2])!)
            default :
                return "0"
            }
    }
    
    func createRandAnswer(equation: [String], level: Int) -> [String] {
        let realAnswer = createAnswer(equation: equation)
        var fakeAnswer = [String]()
        while fakeAnswer.count < 3{
            let randAnswer: Int = randomNumber.nextInt(upperBound: level*10)
            fakeAnswer.append(String(randAnswer))
            if fakeAnswer.contains(realAnswer){
                fakeAnswer.removeLast()
            }
        }
        return fakeAnswer
    }

    
    private func createLeftOperand(level: Int) -> String{
        let leftOperand: Int = randomNumber.nextInt(upperBound: level*10)
        return String(leftOperand)
    }
    
    private func createRightOperand(level: Int) -> String{
        let rightOperand: Int = randomNumber.nextInt(upperBound: level*10)
        return String(rightOperand)
    }
    
    private func createOperator() -> String{
        let chosenOperator: Int = randomNumber.nextInt(upperBound: 2)
        if chosenOperator == 1 {
            return "+"
        }
        else {
            return "-"
        }
    }

    
}
