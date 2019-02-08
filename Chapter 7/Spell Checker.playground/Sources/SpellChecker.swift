import Foundation

typealias RankedWord = (word: String, rank: Int)

public class SpellChecker {
    public var metric: (String, String) -> (Int) = levenshteinDistance
    
    var entries: Set<String> = []
    var rankedWordsByLength: [Int: [RankedWord]] = [:]

    public init(contentsOf file: URL) throws {
        let string = try String(contentsOf: file)
        
        var rank: Int = 1
        string.enumerateLines { (word, _) in
            self.entries.insert(word)
            
            let length = word.count
            var rankedWords = self.rankedWordsByLength[length] ?? []
            rankedWords.append((word, rank))
            self.rankedWordsByLength[length] = rankedWords
            
            rank += 1
        }
    }
    
    public func hasWord(_ word: String) -> Bool {
        return entries.contains(word)
    }
    
    public func suggestions(for word: String) -> [String] {
        guard !hasWord(word) else {
            return [word]
        }
        
        let length = word.count
        
        var edit1: [RankedWord] = []
        var edit2: [RankedWord] = []
        
        let candidates: [RankedWord] = (
            (rankedWordsByLength[length - 1] ?? []) +
            (rankedWordsByLength[length]     ?? []) +
            (rankedWordsByLength[length + 1] ?? [])
        )
        
        for candidate in candidates {
            switch metric(word, candidate.word) {
            case ...1: edit1.append(candidate)
            case 2: edit2.append(candidate)
            default: continue
            }
        }
        
        return (!edit1.isEmpty ? edit1 : edit2)
                    .sorted { $0.rank < $1.rank }
                    .map { $0.word }
    }
}
