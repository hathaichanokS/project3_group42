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
        let symbol = createOperator()
        var operands = createOperand(level:level)
        if Int(operands.first!)! < Int(operands.last!)! && symbol == "-" {
            operands = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: operands) as! [String]
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
            randAnswer.append(String(rand))
        }
        randAnswer.append(realAnswer)
        var shuffledAnswer = [String]()
        shuffledAnswer  = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: randAnswer) as! [String]
        return shuffledAnswer
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
