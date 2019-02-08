import NaturalLanguage

extension NLLanguage: CustomStringConvertible {
    public var description: String {
        return self.rawValue
    }
}
