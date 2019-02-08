import NaturalLanguage

let string = "What's the current temperature in Tokyo?"

let tagger = NLTagger(tagSchemes: [.nameTypeOrLexicalClass])
tagger.string = string

var taggedKeywords: [(NLTag, String)] = []

let stringRange = string.startIndex..<string.endIndex
let options: NLTagger.Options = [.omitWhitespace,
                                 .omitPunctuation,
                                 .joinNames]
tagger.enumerateTags(in: stringRange,
                     unit: .word,
                     scheme: .nameTypeOrLexicalClass,
                     options: options) { (tag, tagRange) in
    guard let tag = tag else { return true }
    switch tag {
    case .noun, .placeName:
        taggedKeywords.append((tag, String(string[tagRange])))
    default:
        break
    }
                        
    return true // continue processing
}

print(taggedKeywords)
