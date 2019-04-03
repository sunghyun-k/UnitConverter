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

let literToPintMultiplier = 2.113
let literToQuartMultiplier = 1.057
let gallonToLiterMultiplier = 3.785


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

// to liter 변환 함수
func toLiter(_ input: Double, from inputUnit: String) -> Double? {
    var result = Double()
    switch inputUnit {
    case "pt":
        result = input / literToPintMultiplier
    case "qt":
        result = input / literToQuartMultiplier
    case "gal":
        result = input * gallonToLiterMultiplier
    case "L":
        result = input
    default:
        return nil
    }
    return result
}

// from inch 변환 함수
func fromInch(_ input: Double, to outputUnit: String) -> (output: Double, unit: String)? {
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
        return nil
    }
    return (resultNumber, unit)
}

// from gram 변환 함수
func fromGram(_ input: Double, to outputUnit: String) -> (output: Double, unit: String)? {
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
        return nil
    }
    return (resultNumber, unit)
}

// from liter 변환 함수
func fromLiter(_ input: Double, to outputUnit: String) -> (output: Double, unit: String)? {
    var resultNumber = Double()
    var unit = String()
    switch outputUnit {
    case "pt":
        resultNumber = input * literToPintMultiplier
        unit = "pt"
    case "qt":
        resultNumber = input * literToQuartMultiplier
        unit = "qt"
    case "gal":
        resultNumber = input / gallonToLiterMultiplier
        unit = "gal"
    case "L", "":
        resultNumber = input
        unit = "L"
    default:
        return nil
    }
    return (resultNumber, unit)
}


// 변환기
func convertUnit(_ input: String) -> String {
    guard let formatedInfo = formatter(input) else {
        return "올바른 형식이 아닙니다."
    }
    var result: (output: Double, unit: String) = (0, "")
    
    // 길이 단위로 확인하면 길이로만 변환 가능하도록 작성
    if let number = toInch(formatedInfo.number, from: formatedInfo.from) {
        if let output = fromInch(number, to: formatedInfo.to) {
            result = output
        }
    } else if let number = toGram(formatedInfo.number, from: formatedInfo.from) {
        if let output = fromGram(number, to: formatedInfo.to) {
            result = output
        }
    } else if let number = toLiter(formatedInfo.number, from: formatedInfo.from) {
        if let output = fromLiter(number, to: formatedInfo.to) {
            result = output
        }
    } else {
        return "지원하지 않는 범위입니다."
    }
    
    // 소수점 넷째자리 반올림
    result.output = (result.output * 1000).rounded() / 1000
    
    return String(result.output) + result.unit
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
