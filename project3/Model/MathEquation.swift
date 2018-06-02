//
//  Equation.swift
//  project3
//
//  Created by Hathaichanok Sreecharoen on 20/5/18.
//  Copyright © 2018 Hathaichanok Sreecharoen. All rights reserved.
//

import GameKit


struct MathEquation {
    
    let randomNumber: GKRandomSource = GKARC4RandomSource()
    
    func createEquation(level:Int) -> [String] {
        var equation = [String]()
        var symbol = createOperator()
        let operands = createOperand(level:level)
        if Int(operands.first!)! < Int(operands.last!)! && symbol == "-" {
            symbol = "+"
        }
        equation.append(operands.first!)
        equation.append(symbol)
        equation.append(operands.last!)
        return equation
    }
    
    private func createAnswer(equation: [String]) -> String {
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
        var randAnswer = [String]()
        let realAnswer = createAnswer(equation: equation)
        while randAnswer.count < 3{
            let rand: Int = randomNumber.nextInt(upperBound: 10)
            if realAnswer != String(rand){
                randAnswer.append(String(rand))
            }
        }
        randAnswer.append(realAnswer)
        var shuffledAnswer = [String]()
        shuffledAnswer  = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: randAnswer) as! [String]
        return shuffledAnswer
    }
    
    func indexAnswer(equation: [String], answer: [String]) -> Int {
        let realAnswer = createAnswer(equation: equation)
        if let i = answer.index(of: realAnswer) {
            return i
        }
        return 0
    }
    
    private func createOperand(level: Int) -> [String] {
        var operands = [String]()
        while operands.count < 2 {
            let operand: Int = randomNumber.nextInt(upperBound: level*10)
            operands.append(String(operand))
        }
        
        return operands
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
