import Foundation

extension CharacterSet {
    /// Returns a character set containing the characters in Unicode General Category Lu and Lt the category of Decimal Numbers.
    public static var uppercaseLettersAndDecimalDigits: CharacterSet {
        return CharacterSet.uppercaseLetters.union(.decimalDigits)
    }
}
