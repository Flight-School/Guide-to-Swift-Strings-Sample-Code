import Foundation

let byte: UInt8 = 0xF0
let encodedString = String(byte, radix: 16, uppercase: true) // "F0"
let decodedByte = UInt8(encodedString, radix: 16)! // 240 (0xF0)

let data = Data(bytes: [0xC0, 0xFF, 0xEE])
data.map { String($0, radix: 16, uppercase: true) } // C0 FF EE
