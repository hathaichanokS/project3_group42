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
    
    private func createLeftOperand(level: Int) -> String{
        let randomNumber: GKRandomSource = GKARC4RandomSource()
        let leftOperand: Int = randomNumber.nextInt(upperBound: level*10)
        return String(leftOperand)
    }
    
    private func createRightOperand(level: Int) -> String{
        let randomNumber: GKRandomSource = GKARC4RandomSource()
        let rightOperand: Int = randomNumber.nextInt(upperBound: level*10)
        return String(rightOperand)
    }
    
    //scope of operator are  + -
    private func createOperator() -> String{
        let randomNumber: GKRandomSource = GKARC4RandomSource()
        let chosenOperator: Int = randomNumber.nextInt(upperBound: 2)
        if chosenOperator == 1 {
            return "+"
        }
        else {
            return "-"
        }
    }
    
}
