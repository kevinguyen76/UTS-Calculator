//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    /// For multi-step calculation, it's helpful to persist existing result
    let validation = Validation();
    
    var currentOperation: String = "+";
    var currentResult: Int = 0;
    
    // Function to set the operation
    func setOperation(operation: String){
        self.currentOperation = operation;
    }
    
    // Depending on what the operation is set to update the current result
    func calInput(input: Int){
        switch currentOperation {
        case ("+"):
            self.currentResult += input;
        case ("-"):
            self.currentResult -= input;
        default:
            print("You cannot do this Calculation");
        }
    }
}

 
