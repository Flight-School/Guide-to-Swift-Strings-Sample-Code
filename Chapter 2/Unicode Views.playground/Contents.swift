let string = "東京 🇯🇵"

for character in string {
    print("\(character)")
    for unicodeScalar in character.unicodeScalars {
        print(unicodeScalar.codePoint, terminator: "\t")
    }
    print()
    
    for utf16CodeUnit in "\(character)".utf16 {
        print(String(utf16CodeUnit, radix: 16, uppercase: true), terminator: "\t")
    }
    print()
    
    for utf8CodeUnit in "\(character)".utf8 {
        print(String(utf8CodeUnit, radix: 16, uppercase: true), terminator: "\t")
    }
    print("\n")
}
