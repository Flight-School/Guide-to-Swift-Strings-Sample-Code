import Foundation

let string = "Hello, world!"
let nsRange = NSRange(string.startIndex..<string.endIndex, in: string)
let range = Range(nsRange, in: string)
