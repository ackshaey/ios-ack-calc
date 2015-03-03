//
//  ModelCalc.swift
//  AckCalc
//
//  Created by Ackshaey Singh on 3/2/15.
//  Copyright (c) 2015 Ackshaey Singh. All rights reserved.
//
//  +−×÷
import Foundation

class ModelCalc {
    var numberStack : [Double] = [0.0]
    var opStack : [String] = []
    
    func appendNumber(number : Double){
        if(numberStack.count <= 2){
            numberStack.append(number)
        }
        println("number stack is : \(numberStack)")
    }
    
    func appendOp(op : String){
        opStack.append(op)
        println("op stack is : \(opStack)")
    }
    
    func clear(){
        opStack = []
        numberStack = [0.0]
    }
    
    func evaluate() -> Double {
        println("Evaluate : Number stack is \(numberStack) and count is \(numberStack.count)")
        var out = 0.0
        if (numberStack.count >= 2 && opStack.count >= 1){
            let op = opStack.removeLast()
            switch op{
            case "+":
                out = add()
            case "×":
                out = multiply()
            case "÷":
                out = divide()
            case "−":
                out = subtract()
            default:
                out = 0.0
            }
        }
        return out
    }
    
    
    private func add() -> Double{
        let a = numberStack.removeLast()
        let b = numberStack.removeLast()
        println("a = \(a), b = \(b), out = \(a+b)")
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
