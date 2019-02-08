import NaturalLanguage

let string = "The sleek white jet soars over the hazy fog."

let tagger = NLTagger(tagSchemes: [.lexicalClass])
tagger.string = string

let stringRange = string.startIndex..<string.endIndex

let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation]
tagger.enumerateTags(in: stringRange,
                     unit: .word,
                     scheme: .lexicalClass,
                     options: options) { (tag, tagRange) in
    if let partOfSpeech = tag?.rawValue {
        print("\(string[tagRange]): \(partOfSpeech)")
    }
        
    return true // continue processing
}
