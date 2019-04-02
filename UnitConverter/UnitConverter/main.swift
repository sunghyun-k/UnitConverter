import Foundation

func convertUnit(_ input: String) -> String {
    return ""
}

// 숫자 나누기
func divide(input: String) -> (Double, String, String)? {
    
    var from = String()
    var to = String()
    
    let inputUnit = input.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789"))
    
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


print(divide(input: "120cm inch"))



//var input = readLine()!
