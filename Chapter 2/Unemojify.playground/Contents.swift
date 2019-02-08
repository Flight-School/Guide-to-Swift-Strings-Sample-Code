//------------------------------------------------------------------------------
// This playground requires Swift 5.0 or higher.
// You can download the latest Swift 5.0 Snapshot here:
// https://swift.org/download/#snapshots
//------------------------------------------------------------------------------

func unemojify<T>(_ string: T) -> String where T: StringProtocol {
    return String(string.filter { character in
        return character.unicodeScalars.allSatisfy { unicodeScalar in
            return unicodeScalar.properties.isEmoji
        }
    })
}

unemojify("EMOJI 👏 MAKES 👏 EVERY 👏 STRING 👏 BETTER 👏")
