import NaturalLanguage
import Foundation

extension NaiveBayesClassifier where Feature == String {
    public func trainText(contentsOf file: URL, unit: NLTokenUnit = .word, for category: Category) throws {
        trainText(try String(contentsOf: file), unit: unit, for: category)
    }
    
    public func trainText(_ string: String, unit: NLTokenUnit = .word, for category: Category) {
        let tagger = NLTagger(tagSchemes: [.lemma])
        tagger.string = string
        
        var features: [Feature] = []
        tagger.enumerateTags(in: string.startIndex..<string.endIndex,
                             unit: .word,
                             scheme: .lemma,
                             options: []) { (tag, tagRange) in
            if let lemma = tag?.rawValue {
                features.append(lemma)
            }
            
            return true // continue processing
        }

        train(features: features, for: category)
    }
    
    public func classifyText(contentsOf file: URL, unit: NLTokenUnit = .word) throws -> Category? {
        return classifyText(try String(contentsOf: file), unit: unit)
    }
    
    public func classifyText(_ string: String, unit: NLTokenUnit = .word) -> Category? {
        let tagger = NLTagger(tagSchemes: [.lemma])
        tagger.string = string
        
        var features: [Feature] = []
        tagger.enumerateTags(in: string.startIndex..<string.endIndex,
                             unit: .word,
                             scheme: .lemma,
                             options: []) { (tag, tagRange) in
            if let lemma = tag?.rawValue {
                features.append(lemma)
            }
            
            return true // continue processing
        }
        
        return classify(features)
    }
}
