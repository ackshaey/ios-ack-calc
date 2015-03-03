//
//  ViewController.swift
//  AckCalc
//
//  Created by Ackshaey Singh on 3/2/15.
//  Copyright (c) 2015 Ackshaey Singh. All rights reserved.
//
//  +−×÷

import UIKit

class ViewController: UIViewController {

    var isTypingDigit = false // State of digit press
    var isTypingOp = false // State of op press
    var typingDigit : Bool{ // Call when digit pressed
        get{
            return isTypingDigit
        }
        set{
            isTypingDigit = newValue
            isTypingOp = !newValue
        }
    }
    var typingOp : Bool{ // Call when op pressed
        get{
            return isTypingOp
        }
        set{
            isTypingDigit = !newValue
            isTypingOp = newValue
        }
    }
    
    let modelCalc = ModelCalc()
    
    var displayString : String {
        get{
            return displayLabel.text!
        }
        set{
            displayLabel.text = newValue
        }
    }
    
    var displayDouble : Double {
        get {
            return NSString(string: displayLabel.text!).doubleValue
        }
        set {
            let str = NSString(format: "%.2f", newValue)
            displayString = str
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func keyOperation(sender: UIButton) {
        if(!typingOp){
            typingOp = true // sets typing number to false
            modelCalc.appendNumber(displayDouble)
            modelCalc.appendOp(sender.currentTitle!)
        }
    }
    
    @IBAction func keyDigit(sender: UIButton) {
        let numberStr = sender.currentTitle!
        if(typingDigit){
            displayString = displayString + numberStr
        } else{
            displayString = numberStr
        }
        typingDigit = true // sets typing op to false
    }
    
    @IBAction func keyEnter() {
        modelCalc.appendNumber(displayDouble)
        let out = modelCalc.evaluate()
        displayDouble = out
    }
    
    @IBAction func keyClear() {
        isTypingDigit = false
        isTypingOp = false
        displayString = "0.00"
        modelCalc.clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

