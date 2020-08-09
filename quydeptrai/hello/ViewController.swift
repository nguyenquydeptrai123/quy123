//
//  ViewController.swift
//  hello
//
//  Created by CNTT on 5/18/20.
//  Copyright © 2020 fit.tdc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var beginning  = true
    
    @IBAction func btnseven(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let savevalue = display.text!
        if beginning {
            if digit != "0" {
                display.text = digit
                beginning = false
            }
        }
        else{
            display.text = savevalue + digit
        }
        
        
    }
    var displayDoubleValue: Double{
        
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    
    @IBAction func quy01(_ sender: UIButton) {
        beginning = true
        if let matSysbol = sender.currentTitle
        {
            switch matSysbol{
            case "∏":
                displayDoubleValue = Double.pi
                 //display.text = String(Double.pi)
            case "e":
                displayDoubleValue = M_E
                //display.text = String(M_E)
            case "√" :
                displayDoubleValue = sqrt(displayDoubleValue)
                //if let operand = display.text{
                  //  display.text = String(sqrt(Double(operand)!))
                //}
                
            default:
                break
                
            }
            
        }
       
    }
}


