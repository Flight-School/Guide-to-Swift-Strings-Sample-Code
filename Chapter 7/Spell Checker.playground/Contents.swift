import Foundation

// https://catalog.ldc.upenn.edu/LDC2006T13
guard let url = Bundle.main.url(forResource: "LDC2006T13-sample",
                                withExtension: "txt")
else {
    fatalError("Missing required resource")
}

let spellChecker = try SpellChecker(contentsOf: url)

spellChecker.suggestions(for: "speling")
