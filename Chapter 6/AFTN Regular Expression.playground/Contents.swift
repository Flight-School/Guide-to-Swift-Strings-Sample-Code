import Foundation

let string = """
ZCZC NRA062 270930
GG KHIOYYYX
311521 KTTDZTZX

AIR SWIFT FLIGHT 42
CANCELED

NNNN
"""

let pattern = #"""
(?x-i)
\A
ZCZC \h
(?<transmission>[A-Z]{3}[0-9]{3}) \h (?<additionalService>[0-9]{0,8}) \n
(?<priority>[A-Z]{2}) \h (?<destination>[A-Z]{8}) \n
(?<time>[0-9]{6}) \h (?<origin>[A-Z]{8}) \n+
(?<text>[[A-Z][0-9]\h\n]+) \s*
NNNN
\Z
"""#

let regex = try NSRegularExpression(pattern: pattern,
                                    options: [])

let stringRange = NSRange(string.startIndex..<string.endIndex, in: string)
if let match = regex.firstMatch(in: string,
                                options: [],
                                range: stringRange)
{
    for name in [
        "transmission", "additionalService",
        "priority", "destination",
        "time", "origin",
        "text"
    ] {
        let nameRange = match.range(withName: name)
        if nameRange.location != NSNotFound,
            let range = Range(nameRange, in: string)
        {
            print("\(name): \(string[range])")
        }
    }
}
