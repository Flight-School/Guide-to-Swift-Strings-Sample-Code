func filterNonEmoji<T>(from string: T) -> String where T: StringProtocol {
    return String(string.filter { character in
        character.unicodeScalars.allSatisfy { unicodeScalar in
            unicodeScalar.properties.isEmoji
        }
    })
}

filterNonEmoji(from: "EMOJI 👏 MAKE 👏 STRINGS 👏 BETTER 👏")
