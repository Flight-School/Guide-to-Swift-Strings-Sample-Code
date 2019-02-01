import func Darwin.strlen

do {
    var ascii: [UInt8] = [0x43, 0x00]
    let string = String(cString: &ascii)
    
    string.withCString { pointer in
        strlen(pointer)
    }
}

do {
    "hello".uppercased() // "HELLO"
    "HELLO".lowercased() // "hello"
}

do {
    let prefix = "airport".prefix(3) // "air"
    "airplane".hasPrefix(prefix) // true
    
    let suffix = "airport".suffix(4) // "port"
    "airplane".hasSuffix(suffix) // false
}

extension StringProtocol {
    var isPalindrome: Bool {
        let normalized = self.lowercased()
                             .filter { $0.isLetter }
        
        return normalized.elementsEqual(normalized.reversed())
    }
}

do {
    let string = "I’m a fool; aloof am I."
    string.isPalindrome // true
    
    let range = string.firstIndex(of: "a")!...string.lastIndex(of: "a")!
    string[range].isPalindrome // true
}

struct Wrapper<Value> where Value: StringProtocol { }

extension Array where Element: StringProtocol { }
