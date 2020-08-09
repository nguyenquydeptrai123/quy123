//
//  ViewController.swift
//  caculator
//
//  Created by Vodinhlong on 5/17/20.
//  Copyright © 2020 Vodinhlong.tdc.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:Prototies
    var isBeginning = true
    @IBOutlet weak var display: UILabel!
    
       @IBAction func btn1(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let currentDisplayValue = display.text!
        if isBeginning{
            if digit != "0"{
            display.text = digit
            isBeginning = false
            }
        }
        else{
            display.text=currentDisplayValue+digit
        }
        
        //print("Button \(digit) ís pressed")
        
    }
    var displayDoubleValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
        
        
        
    }
    
    let brain = CalulatorBrain()
    
    @IBAction func calculatorFunxtions(_ sender: UIButton) {
        isBeginning = true
        brain.setOperand(operand: displayDoubleValue)
        if let mathSymbol = sender.currentTitle{
            brain.performCalculate(matSymbol: mathSymbol)
        }
        if let result = brain.result {
            displayDoubleValue = result
        }
    }
    
    
}

