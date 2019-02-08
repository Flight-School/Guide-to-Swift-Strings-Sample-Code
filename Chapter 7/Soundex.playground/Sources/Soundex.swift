public func soundex(_ string: String) -> String {
    guard case let (head?, tail) =
            (string.first, string.dropFirst())
    else {
            return string
    }
    
    func substitute(_ character: Character) -> Character? {
        switch character {
        case "b", "f", "p", "v":
            return "1"
        case "c", "g", "j", "k", "q", "s", "x", "z":
            return "2"
        case "d", "t":
            return "3"
        case "l":
            return "4"
        case "m", "n":
            return "5"
        case "r":
            return "6"
        default:
            return nil
        }
    }
    
    return tail.lowercased()
               .compactMap(substitute)
               .reduce(into: "\(head)") { (result, character) in
                   if result.last != character {
                       result.append(character)
                   }
               }
               .prefix(4)
               .rpad(with: "0", to: 4)
}
