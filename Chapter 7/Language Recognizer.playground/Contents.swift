import NaturalLanguage

let string = """
Sehr geehrte Damen und Herren,
herzlich willkommen in Frankfurt.
"""

let languageRecognizer = NLLanguageRecognizer()
languageRecognizer.processString(string)

let dominantLanguage = languageRecognizer.dominantLanguage
