//
//  File.swift
//  caculator
//
//  Created by CNTT on 6/1/20.
//  Copyright © 2020 Vodinhlong.tdc.edu. All rights reserved.
//

import Foundation
func sign(operand: Double) -> Double
{
    return -operand
}
class CalulatorBrain{
    var accumlator: Double?
    
    enum Operation {
        case constant(Double)
        case unbinaryOperation((Double) -> Double)
    }
    
    var operations: Dictionary<String, Operation> = [
        "∏": Operation.constant(Double.pi),
        "℮": Operation.constant(M_E),
        "√": Operation.unbinaryOperation(sqrt),
        "cos": Operation.unbinaryOperation(cos),
        "±": Operation.unbinaryOperation(sign)
    ]
    
    func setOperand(operand: Double){
        accumlator = operand
    }

    func performCalculate(matSymbol: String){
        if let operation = operations[matSymbol] {
            switch operation{
            case .constant(let value):
                accumlator = value
            case.unbinaryOperation(let function):
                accumlator = function(accumlator!)
                }
            }
        }
//        switch matSymbol {
//        case "∏":
//            accumlator = Double.pi
//        case "℮":
//            accumlator = M_E
//        case "√":
//            accumlator = sqrt (accumlator!)
//        default:
//            break
//        }
    
    var result:Double?{
        get{
            return accumlator
        }
    }
    }



