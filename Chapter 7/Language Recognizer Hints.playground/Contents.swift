import NaturalLanguage

let string = """
God morgen mine damer og herrer.
"""

let languageRecognizer = NLLanguageRecognizer()
languageRecognizer.processString(string)

languageRecognizer.dominantLanguage // da

languageRecognizer.languageHints = [.norwegian: 0.75,
                                    .swedish: 0.25]

languageRecognizer.dominantLanguage // nb
