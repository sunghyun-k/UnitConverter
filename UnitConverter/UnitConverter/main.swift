import Foundation

// 숫자와 문자 나누기
func divide(_ input: String) -> (number: Double, from: String, to: String)? {
    
    var from = ""
    var to = ""
    
    let inputUnit = input.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))
    
    let inputUnitSplited = inputUnit.split(separator: " ")
    from = String(inputUnitSplited[0])
    if inputUnitSplited.indices.contains(1) {
        to = String(inputUnitSplited[1])
    }
    
    guard let number = Double(input.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789.").inverted)) else {
        return nil
    }
    return (number, from, to)
}


// 변환에 곱하는 수
let meterToInchMultiplier = 39.37
let inchToCentimeterMuliplier = 2.54
let yardToInchMultiplier: Double = 36

// to inch 변환 함수들
func meterToInch(_ input: Double) -> Double {
    return input * meterToInchMultiplier
}
func centimeterToInch(_ input: Double) -> Double {
    return input / inchToCentimeterMuliplier
}
func yardToInch(_ input: Double) -> Double {
    return input * yardToInchMultiplier
}

// from inch 변환 함수들
func inchToMeter(_ input: Double) -> Double {
    return input / meterToInchMultiplier
}
func inchToCentimeter(_ input: Double) -> Double {
    return input * inchToCentimeterMuliplier
}
func inchToYard(_ input: Double) -> Double {
    return input / yardToInchMultiplier
}

// 변환하기
func convertUnit(_ input: String) -> String {
    guard let dividedNumber = divide(input) else {
        return "올바른 형식이 아닙니다."
    }
    var result = Double()
    
    switch dividedNumber.from {
    case "m":
        result = meterToInch(dividedNumber.number)
    case "cm":
        result = centimeterToInch(dividedNumber.number)
    case "yard":
        result = yardToInch(dividedNumber.number)
    case "inch":
        result = dividedNumber.number
    default:
        return "지원하지 않는 범위입니다."
    }
    
    switch dividedNumber.to {
    case "m":
        result = inchToMeter(result)
        return String(result) + "m"
    case "cm":
        result = inchToCentimeter(result)
        return String(result) + "cm"
    case "yard":
        result = inchToYard(result)
        return String(result) + "yard"
    case "inch", "":
        return String(result) + "inch"
    default:
        return "지원하지 않는 범위입니다."
    }
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
