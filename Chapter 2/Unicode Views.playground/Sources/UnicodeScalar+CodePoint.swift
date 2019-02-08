extension Unicode.Scalar {
    public var codePoint: String {
        let representation = String(self.value, radix: 16, uppercase: true)
        return "U+" + String(repeating: "0", count: max(4 - representation.count, 0)) + representation
    }
}
