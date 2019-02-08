import Foundation

let url = Bundle.main.url(forResource: "file", withExtension: "txt")!
try String(contentsOf: url) // "Hello!"

let data = try Data(contentsOf: url)
String(data: data, encoding: .utf8) // "Hello!"
