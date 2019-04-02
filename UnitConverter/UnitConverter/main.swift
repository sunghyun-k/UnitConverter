import Foundation

// 숫자와 문자 나누기
func divide(_ input: String) -> (number: Double, from: String, to: String)? {
    
    var from = String()
    var to = String()
    
    let inputUnit = input.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))
    
    guard let index = inputUnit.firstIndex(of: " ") else {
        return nil
    }
    from = String(inputUnit[..<index])
    to = String(inputUnit[index...])
    to = to.replacingOccurrences(of: " ", with: "")
    
    guard let number = Double(input.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted)) else {
        return nil
    }
    return (number, from, to)
}

// 변환 함수들
func meterToInch(_ input: Double) -> Double {
    return input * 39.37
}
func centimeterToInch(_ input: Double) -> Double {
    return input / 2.54
}
func inchToMeter(_ input: Double) -> Double {
    return input / 39.37
}
func inchTocentimeter(_ input: Double) -> Double {
    return input * 2.54
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
    case "inch":
        break
    default:
        return "지원하지 않는 범위입니다."
    }
    
    switch dividedNumber.to {
    case "m":
        result = inchToMeter(dividedNumber.number)
        return String(result) + "m"
    case "cm":
        result = inchTocentimeter(dividedNumber.number)
        return String(result) + "cm"
    case "inch":
        return String(result) + "inch"
    default:
        return "지원하지 않는 범위입니다."
    }
}



var input = readLine()!

print(convertUnit(input))
