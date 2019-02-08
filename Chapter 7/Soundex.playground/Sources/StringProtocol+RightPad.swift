extension StringProtocol {
    func rpad(with character: Character, to length: Int) -> String {
        guard count < length else { return String(self) }
        return String(self) + repeatElement(character, count: length - count)
    }
}
