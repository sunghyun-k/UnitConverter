//
//  main.swift
//  UnitConverter
//
//  Created by 김성현 on 02/04/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import Foundation

var input = readLine()!
func ConvertDouble (input: String) -> Double {
    let result = Double(input.trimmingCharacters(in: ["c","m"]))!
    return result
}
var myDouble = ConvertDouble(input: input)

func convertCmToM(input: Double) -> String {
    
    let result = myDouble / 100
    return String(result) + "m"
}

print(convertCmToM(input: ConvertDouble(input: input)))
