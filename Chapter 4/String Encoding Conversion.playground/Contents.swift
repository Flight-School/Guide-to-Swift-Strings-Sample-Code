import Foundation

"Hello, Macintosh!".data(using: .macOSRoman)

"Avión ✈️".canBeConverted(to: .ascii)
"Avión ✈️".data(using: .ascii)
if let data = "Avión ✈️".data(using: .ascii, allowLossyConversion: true) {
    String(data: data, encoding: .ascii)
}

"Airplane".fastestEncoding
"飛行機".smallestEncoding
