import Foundation

// Provided in Swift 5.0 by `properties.name`
// See SE-0211: "Add Unicode Properties to Unicode.Scalar"
// https://github.com/apple/swift-evolution/blob/master/proposals/0211-unicode-scalar-properties.md
extension Unicode.Scalar {
    var name: String? {
        guard var escapedName =
            "\(self)".applyingTransform(.toUnicodeName,
                                        reverse: false)
            else {
                return nil
        }
        
        escapedName.removeFirst(3) // remove "\\N{"
        escapedName.removeLast(1) // remove "}"
        
        return escapedName
    }
}

public struct UnicodeLogger: TextOutputStream {
    public init() {}
    
    public mutating func write(_ string: String) {
        guard !string.isEmpty && string != "\n" else {
            return
        }
        
        for (index, unicodeScalar) in string.unicodeScalars.lazy.enumerated() {
            let codePoint = String(format: "U+%04X", unicodeScalar.value)
            let name = unicodeScalar.name ?? ""
            print("\(index): \(unicodeScalar) \(codePoint)\t\(name)")
        }
    }
}

extension UnicodeLogger: CustomStringConvertible {
    public var description: String {
        return "UnicodeLogger"
    }
}
