import Foundation
import NaturalLanguage

// Air Traffic Control Complete - Sample
// https://catalog.ldc.upenn.edu/LDC94S14A
guard let url = Bundle.main.url(forResource: "LDC94S14A-sample",
                                withExtension: "txt") else {
    fatalError("Missing resource LDC94S14A-sample.txt")
}

let text = try String(contentsOf: url)
var markovChain = MarkovChain(sentencesAndWords(for: text))

for _ in 1...10 {
    for word in markovChain {
        print(word, terminator: " ")
    }
    
    print()
}
