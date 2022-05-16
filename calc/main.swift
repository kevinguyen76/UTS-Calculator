//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments;
args.removeFirst(); // remove the name of the program

// Initialize a Calculator object
let calc = Calculator();

// Initialize a Validation Object
let validation = Validation();

// Check if only single input
if (args.count == 1){
    // If input is not a number, exit
    if (!validation.isNumber(args[0])){
        print("Invalid Input, please enter a number first!");
        exit(1);
    }
    
    // Print input if it's a number
    print(Int(args[0]) ?? 0);
    exit(0);
}

// Check if remainder of argument count is 0
// If true then exit
if (args.count % 2 == 0){
    print("Invalid Input! Make sure there is sufficient numbers and operations");
    exit(1);
}

//Check for operations are valid
for i in stride(from: 1, to: args.count - 1, by: 2){
    if (!["x","+","-","/","%"].contains(args[i])) {
        exit(1);
    }
}

// check for nums input are valid
for i in stride(from: 0, to: args.count, by: 2){
    if (args[i].contains(".") || Int(args[i]) == nil){
        print("Make sure number inputs are integers");
        exit(1);
    }
}

// While array contains "special" operations then loop over the array

while (args.contains{["x", "/", "%"].contains($0)}){
    for index in args.indices{
        // if the loops find a "/" do the calcualtion then update the original array
        if (args[index] == "/"){
            let result = (Int(args[index - 1]) ?? 0) / (Int(args[index + 1]) ?? 0);
            args.replaceSubrange((index - 1)...(index + 1), with: [String(result)]);
            break;
        }
        // else if the loops find a "x" do the calcualtion then update the original array
        else if (args[index] == "x"){
            let result = (Int(args[index - 1]) ?? 0) * (Int(args[index + 1]) ?? 0);
            args.replaceSubrange((index - 1)...(index + 1), with: [String(result)]);
            break;
        }
        // else if the loops find a "%" do the calcualtion then update the original array
        else if (args[index] == "%"){
            let result = (Int(args[index - 1]) ?? 0) % (Int(args[index + 1]) ?? 0);
            args.replaceSubrange((index - 1)...(index + 1), with: [String(result)]);
            break;
        }
    }
}

// At This point the array should now only contain "+" or "-" so we can calculate the array from left to right.

for index in args.indices{
    // If index is an operation and if the next input is not an operation then setOperation to the index
    // E.g 3 + 5 setOperation = "+"
    if (validation.isOperation(args[index]) && !validation.isOperation(args[index + 1])){
        calc.setOperation(operation: args[index]);
    } else if (validation.isNumber(args[index])) {  // validating if input is an integer
        calc.calInput(input: Int(args[index]) ?? 0);
    } else {    // otherwise if both conditions fail exit
        exit(1);
    }
}

// Print the calculated result
print(calc.currentResult);

