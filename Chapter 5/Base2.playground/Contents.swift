let byte: UInt8 = 0xF0

let encodedString = String(byte, radix: 2) // "11110000"
let decodedByte = UInt8(encodedString, radix: 2) // 240
