import NaturalLanguage

public func sentencesAndWords(for string: String) -> [[String]] {
    let sentenceTokenizer = NLTokenizer(unit: .sentence)
    sentenceTokenizer.string = string
    
    let wordTokenizer = NLTokenizer(unit: .word)
    wordTokenizer.string = string
    
    var output: [[String]] = []
    sentenceTokenizer.enumerateTokens(in: string.startIndex..<string.endIndex) { (sentenceRange, _) in
        let words = wordTokenizer.tokens(for: sentenceRange)
                                 .map { String(string[$0]) }
        output.append(words)
        
        return true // continue processing
    }
    
    return output
}
