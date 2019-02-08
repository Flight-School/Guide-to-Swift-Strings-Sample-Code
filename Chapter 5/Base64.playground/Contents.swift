import Foundation

let string = "Hello!"

let data = string.data(using: .utf8)!
let encodedString = data.base64EncodedString()

let decodedData = Data(base64Encoded: encodedString)!
let decodedString = String(data: decodedData, encoding: .utf8)
