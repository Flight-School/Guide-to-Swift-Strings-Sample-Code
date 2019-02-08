import NaturalLanguage

let string = """
Please direct your attention to flight attendants
as we review the safety features of this aircraft.
"""

let tokenizer = NLTokenizer(unit: .word)
tokenizer.string = string
let words = tokenizer.tokens(for: string.startIndex..<string.endIndex)
                     .map { String(string[$0]) }

print("Bigrams:")
for bigram in bigrams(words) {
    print(bigram)
}

print("\n")

print("Trigrams:")
for trigram in trigrams(words) {
    print(trigram)
}
