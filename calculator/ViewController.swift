//
//  ViewController.swift
//  calculator
//
//  Created by CNTT on 5/18/20.
//  Copyright © 2020 fit.tdc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var isbeginning = true
    
    @IBAction func quy9(_ sender: UIButton) {
        let currentDisplayValue = display.text!
        
        let digit = sender.currentTitle!
        if isbeginning {
            if digit != "0"{
                display.text = digit
                isbeginning = false
            }
        }
        else{
            display.text = currentDisplayValue + digit
        }
        //print("chin \(digit) 9")
    }
    @IBAction func quy8(_ sender: UIButton) {
        let currentDisplayValue = display.text!
        
        let digit = sender.currentTitle!
        if isbeginning {
            if digit != "0"{
                display.text = digit
                isbeginning = false
            }
        }
        else{
            display.text = currentDisplayValue + digit
        }
        //print("tam \(digit) 8");
    }
    @IBAction func quy7(_ sender: UIButton) {
        let currentDisplayValue = display.text!
        
        let digit = sender.currentTitle!
        if isbeginning {
            if digit != "0"{
                display.text = digit
                isbeginning = false
            }
        }
        else{
            display.text = currentDisplayValue + digit
        }
        //print("bay \(digit) 7");
    }
    @IBAction func quy6(_ sender: UIButton) {
        let currentDisplayValue = display.text!
        
        let digit = sender.currentTitle!
        if isbeginning {
            if digit != "0"{
                display.text = digit
                isbeginning = false
            }
        }
        else{
            display.text = currentDisplayValue + digit
        }
        //print("sau \(digit) 6");
    }
    @IBAction func quy5(_ sender: UIButton) {
        let currentDisplayValue = display.text!
        
        let digit = sender.currentTitle!
        if isbeginning {
            if digit != "0"{
                display.text = digit
                isbeginning = false
            }
        }
        else{
            display.text = currentDisplayValue + digit
        }
        //print("nam \(digit) 5");
    }
    @IBAction func quy4(_ sender: UIButton) {
        let currentDisplayValue = display.text!
        
        let digit = sender.currentTitle!
        if isbeginning {
            if digit != "0"{
                display.text = digit
                isbeginning = false
            }
        }
        else{
            display.text = currentDisplayValue + digit
        }
       // print("bon \(digit) 4");
    }
    @IBAction func quy3(_ sender: UIButton) {
        let currentDisplayValue = display.text!
        
        let digit = sender.currentTitle!
        if isbeginning {
            if digit != "0"{
                display.text = digit
                isbeginning = false
            }
        }
        else{
            display.text = currentDisplayValue + digit
        }
       // print("ba \(digit) 3");
    }
    
    @IBAction func quy2(_ sender: UIButton) {
        let currentDisplayValue = display.text!
        
        let digit = sender.currentTitle!
        if isbeginning {
            if digit != "0"{
                display.text = digit
                isbeginning = false
            }
        }
        else{
            display.text = currentDisplayValue + digit
        }
        //print("hai \(digit) 2");
    }
    @IBAction func quy1(_ sender: UIButton) {
        let currentDisplayValue = display.text!
        
        let digit = sender.currentTitle!
        if isbeginning {
            if digit != "0"{
                display.text = digit
                isbeginning = false
            }
        }
        else{
            display.text = currentDisplayValue + digit
        }
        //print("mot \(digit) 1");
    }
    @IBAction func quy(_ sender: UIButton) {
        let currentDisplayValue = display.text!
        
        let digit = sender.currentTitle!
        if isbeginning {
            if digit != "0"{
                display.text = digit
                isbeginning = false
            }
        }
        else{
            display.text = currentDisplayValue + digit
        }
       // print("khong \(digit) 0");
    }
}
    


    


