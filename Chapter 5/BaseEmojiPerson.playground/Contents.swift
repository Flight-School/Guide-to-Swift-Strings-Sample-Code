let data = "Fly".data(using: .utf8)!
let encodedString = data.base🧑EncodedString()

encodedString.count
encodedString.data(using: .utf8)?.count
