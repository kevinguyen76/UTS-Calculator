//
//  validation.swift
//  calc
//
//  Created by Kevin Nguyen on 12/3/2022.
//  Copyright © 2022 UTS. All rights reserved.
//

import Foundation


class Validation {
    let validOperations = ["+","-","x","/","%"];
    
    // Helper function to check if the input is a valid operation
    func isOperation(_ input: String) -> Bool {
        return validOperations.contains(input);
    }
    
    // Helper function to check if the inpuer is a valid integer
    func isNumber(_ input: String) -> Bool{
        return Int(input) != nil;
    }
    
    
}

