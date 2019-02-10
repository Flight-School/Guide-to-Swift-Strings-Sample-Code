//------------------------------------------------------------------------------
// This playground requires Swift 5.0 or higher.
// You can download the latest Swift 5.0 Snapshot here:
// https://swift.org/download/#snapshots
//------------------------------------------------------------------------------

func filterNonEmoji<T>(from string: T) -> String where T: StringProtocol {
    return String(string.filter { character in
        character.unicodeScalars.allSatisfy { unicodeScalar in
            unicodeScalar.properties.isEmoji
        }
    })
}

filterNonEmoji(from: "EMOJI 👏 MAKE 👏 STRINGS 👏 BETTER 👏")
