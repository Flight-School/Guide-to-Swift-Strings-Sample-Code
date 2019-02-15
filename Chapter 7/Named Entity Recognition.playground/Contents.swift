import NaturalLanguage

let string = """
Fang Liu of China is the current Secretary General of ICAO.
"""

let tagger = NLTagger(tagSchemes: [.nameType])
tagger.string = string

let stringRange = string.startIndex..<string.endIndex

let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
tagger.enumerateTags(in: stringRange,
                     unit: .word,
                     scheme: .nameType,
                     options: options) { (tag, tagRange) in
    if let nameType = tag?.rawValue, tag != .otherWord {
        print("\(string[tagRange]): \(nameType)")
    }

    return true // continue processing
}
