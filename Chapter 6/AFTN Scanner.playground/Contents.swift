import Foundation

let string = """
ZCZC NRA062 270930
GG KHIOYYYX
311521 KTTDZTZX

AIR SWIFT FLIGHT 42
CANCELED

NNNN
"""

let scanner = Scanner(string: string)
scanner.charactersToBeSkipped = .whitespacesAndNewlines

try scanner.scan("ZCZC")
let transmission = try scanner.scan(.uppercaseLettersAndDecimalDigits)
let additionalServices = try scanner.scan(.decimalDigits)
let priority = try scanner.scan(.uppercaseLetters)
let destination = try scanner.scan(.uppercaseLetters)
let time = try scanner.scan(.decimalDigits)
let origin = try scanner.scan(.uppercaseLetters)
let text = try scanner.scan(upTo: "NNNN")
