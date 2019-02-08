import NaturalLanguage

let string = """
Sehr geehrte Damen und Herren,
herzlich willkommen in Frankfurt.
"""

let tagSchemes: [NLTagScheme] = [.language, .script]
let tagger = NLTagger(tagSchemes: tagSchemes)
tagger.string = string

for scheme in tagSchemes {
    if case let (tag?, _) = tagger.tag(at: string.startIndex,
                                       unit: .word,
                                       scheme: scheme) {
        print(tag)
    }
}
