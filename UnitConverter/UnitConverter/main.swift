//
//  main.swift
//  UnitConverter
//
//  Created by 김성현 on 02/04/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import Foundation

func centimeterToMeter(_ input: Int) -> Double {
    var result = Double()
    result = Double(input) / 100
    
    return result
}

var input = 120
var result = centimeterToMeter(120)
print(result)
