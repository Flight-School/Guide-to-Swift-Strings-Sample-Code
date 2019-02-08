import NaturalLanguage

let string = """
Flying flights fly flyers flown.
"""

let tagger = NLTagger(tagSchemes: [.lemma])
tagger.string = string

tagger.enumerateTags(in: string.startIndex..<string.endIndex,
                     unit: .word,
                     scheme: .lemma,
                     options: []) { (tag, tagRange) in
    if let lemma = tag?.rawValue {
        print("\(string[tagRange]): \(lemma)")
    }
        
    return true // continue processing
}
