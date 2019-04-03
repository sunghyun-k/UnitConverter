import Foundation

// 숫자와 문자 나누기
func formatter(_ input: String) -> (number: Double, from: String, to: String)? {
    
    var from = String()
    var to = String()
    
    let inputUnit = input.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))
    
    let inputUnitSplited = inputUnit.split(separator: " ")
    if inputUnitSplited.indices.contains(0) {
        from = String(inputUnitSplited[0])
    } else {
        return nil
    }
    if inputUnitSplited.indices.contains(1) {
        to = String(inputUnitSplited[1])
    }
    
    guard let number = Double(input.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted)) else {
        return nil
    }
//    print("number: \(number), from: \(from), to: \(to)")
    return (number, from, to)
}


// 변환에 곱하는 수
let meterToInchMultiplier = 39.37
let inchToCentimeterMuliplier = 2.54
let yardToInchMultiplier: Double = 36
let kilogramToGramMultiplier: Double = 1000
let poundToGramMultiplier = 453.592
let ounceToGramMultiplier = 28.35

// to inch 변환 함수
func toInch(_ input: Double, from inputUnit: String) -> Double? {
    var result = Double()
    switch inputUnit {
    case "m":
        result = input * meterToInchMultiplier
    case "cm":
        result = input / inchToCentimeterMuliplier
    case "yard":
        result = input * yardToInchMultiplier
    case "inch":
        result = input
    default:
        return nil
    }
    return result
}

// to gram 변환 함수
func toGram(_ input: Double, from inputUnit: String) -> Double? {
    var result = Double()
    switch inputUnit {
    case "kg":
        result = input * kilogramToGramMultiplier
    case "lb", "lbs":
        result = input * poundToGramMultiplier
    case "oz":
        result = input * ounceToGramMultiplier
    case "g":
        result = input
    default:
        return nil
    }
    return result
}

// from inch 변환 함수
func fromInch(_ input: Double, to outputUnit: String) -> String {
    var resultNumber = Double()
    var unit = String()
    switch outputUnit {
    case "m":
        resultNumber = input / meterToInchMultiplier
        unit = "m"
    case "cm":
        resultNumber = input * inchToCentimeterMuliplier
        unit = "cm"
    case "yard":
        resultNumber = input / yardToInchMultiplier
        unit = "yard"
    case "inch", "":
        resultNumber = input
        unit = "inch"
    default:
        return "지원하지 않는 범위입니다."
    }
    return String(resultNumber) + unit
}

// from gram 변환 함수
func fromGram(_ input: Double, to outputUnit: String) -> String {
    var resultNumber = Double()
    var unit = String()
    switch outputUnit {
    case "kg":
        resultNumber = input / kilogramToGramMultiplier
        unit = "kg"
    case "lbs", "lb":
        resultNumber = input / poundToGramMultiplier
        unit = "lbs"
    case "oz":
        resultNumber = input / ounceToGramMultiplier
        unit = "oz"
    case "g", "":
        resultNumber = input
        unit = "g"
    default:
        return "지원하지 않는 범위입니다."
    }
    return String(resultNumber) + unit
}




// 변환기
func convertUnit(_ input: String) -> String {
    
    guard let formatedInfo = formatter(input) else {
        return "올바른 형식이 아닙니다."
    }
    var result = ""
    
    if let number = toInch(formatedInfo.number, from: formatedInfo.from) {
        result = fromInch(number, to: formatedInfo.to)
    } else if let number = toGram(formatedInfo.number, from: formatedInfo.from) {
        result = fromGram(number, to: formatedInfo.to)
    } else {
        return "지원하지 않는 범위입니다."
    }
    return result
}

// 유저 컨트롤
func userController() {
    while true {
        let input = readLine()!
        if input == "q" {
            break
        }
        print(convertUnit(input))
    }
}


userController()
