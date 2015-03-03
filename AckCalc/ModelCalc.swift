//
//  ModelCalc.swift
//  AckCalc
//
//  Created by Ackshaey Singh on 3/2/15.
//  Copyright (c) 2015 Ackshaey Singh. All rights reserved.
//

import Foundation

class ModelCalc {
    var numberStack : [Double] = []
    var opStack : [String] = []
    
    func appendNumber(number : Double){
        numberStack.append(number)
    }
    
    func appendOp(op : String){
        opStack.append(op)
    }
    
    func evaluate() -> Double {
        var out = 0.0
        let op = opStack.removeLast()
        switch op{
        case "+":
            out = add()
        case "*":
            out = multiply()
        case "/":
            out = divide()
        case "-":
            out = subtract()
        default:
            out = 0.0
        }
        return out
    }
    //        +−×÷
    
    private func add() -> Double{
        let a = numberStack.removeLast()
        let b = numberStack.removeLast()
        return a + b
    }
    
    private func multiply() -> Double{
        let a = numberStack.removeLast()
        let b = numberStack.removeLast()
        return a * b
    }
    
    private func subtract() -> Double{
        let a = numberStack.removeLast()
        let b = numberStack.removeLast()
        return b - a
    }
    
    private func divide() -> Double{
        let a = numberStack.removeLast()
        let b = numberStack.removeLast()
        return b / a
    }
}
