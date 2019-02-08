import NaturalLanguage

extension NLTag: CustomStringConvertible {
    public var description: String {
        return self.rawValue
    }
}
