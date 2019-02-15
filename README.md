<a href="https://flight.school/books/strings">
    <img src="cover.jpg" alt="Flight School Guide to Swift Strings Cover" title="Flight School Guide to Swift Strings" width="216" height="332" align="right">
</a>

# Guide to Swift Strings Sample Code

[![Build Status][build status badge]][build status]
[![License][license badge]][license]
[![Swift Version][swift version badge]][swift version]

This repository contains sample code used in the
[Flight School Guide to Swift Strings](https://flight.school/books/strings).

---

- [Chapter 2: Working with Strings in Swift](#chapter-2)
- [Chapter 3: Swift String Protocols and Supporting Types](#chapter-3)
- [Chapter 4: Working with Foundation String APIs](#chapter-4)
- [Chapter 5: Binary-to-Text Encoding](#chapter-5)
- [Chapter 6: Parsing Data From Text](#chapter-6)
- [Chapter 7: Natural Language Processing](#chapter-7)

---

## Chapter 2

### String Literals

You can construct string values in Swift using string literals.
This Playground has examples of each variety,
from the conventional, single-line to the raw, multi-line.

```swift
let multilineRawString = #"""
 \-----------------------\
  \                       \
   \      ___              \
    \    (_  /'_ /_/        \        __
     \   /  (/(//)/          \       | \
      >      _/               >------|  \       ______
     /     __                /       --- \_____/**|_|_\____  |
    /     (  _ /     /      /          \_______ --------- __>-}
   /     __)( /)()()(      /              /  \_____|_____/   |
  /                       /               *         |
 /-----------------------/                         {o}
"""#
```

### String Indexes

Swift strings have opaque index types.
One consequence of this is that
you can't access character by integer position directly,
as you might in other languages.
This Playground shows various strategies for
working with string indices and ranges.

```swift
let string = "Hello"

string[string.startIndex] // "H"
string[string.index(after: string.startIndex)] // "e"
string[string.index(string.startIndex, offsetBy: 4)] // "o"
```

### Canonical Equivalence

In Swift,
two `String` values are considered equal if they are
<dfn>[canonically equivalent](http://unicode.org/notes/tn5/)</dfn>,
even if they comprise different Unicode scalar values.

```swift
let precomposed = "expos\u{00E9}" // é LATIN SMALL LETTER E WITH ACUTE
let decomposed = "expose\u{0301}" // ´ COMBINING ACUTE ACCENT

precomposed == decomposed
precomposed.elementsEqual(decomposed) // true

precomposed.unicodeScalars.elementsEqual(decomposed.unicodeScalars) // false
```

### Unicode Views

Swift `String` values
provide views to their UTF-8, UTF-16, and UTF-32 code units.
This Playground shows the correspondence between
the characters in a string and their various encoding forms.

```swift
let string = "東京 🇯🇵"
for unicodeScalar in character.unicodeScalars {
    print(unicodeScalar.codePoint, terminator: "\t")
}
```

### Character Number Values

In Swift 5,
you can access several Unicode properties of `Character` values,
which allow you to determine things like
Unicode general category membership,
whether a character has case mapping (lowercase / uppercase / titlecase),
and whether the character has an associated number value.

```swift
// U+2460 CIRCLED DIGIT ONE
("①" as Character).isNumber // true
("①" as Character).isWholeNumber // true
("①" as Character).wholeNumberValue // 1
```

### Emoji Detection

For more direct access to the aforementioned character information,
you can do so through the `properties` property on `Unicode.Scalar` values.
For example,
the `isEmoji` property does...
well, exactly what you'd expect it to do.

```swift
("👏" as Unicode.Scalar).properties.isEmoji // true
```

## Chapter 3

### String as **\*\***\_\_\_**\*\***

In Swift,
`String` functionality is inherited from
a complex hierarchy of interrelated protocols,
including
`Sequence`,
`Collection`,
`BidirectionalCollection`,
`RangeReplaceableCollection`,
`StringProtocol`,
and others.

Each of the protocols mentioned have their own Playground
demonstrating the specific functionality they provide.

```swift
"Boeing 737-800".filter { $0.isCased }
                .map { $0.uppercased() }
["B", "O", "E", "I", "N", "G"]
```

### Unicode Logger

The `print` function can direct its output
to a custom type conforming to the `TextOutputStream` protocol.
This example implements a logger
that prints the Unicode code points of the provided string.

```swift
var logger = UnicodeLogger()
print("👨‍👩‍👧‍👧", to: &logger)

// 0: 👨 U+1F468	MAN
// 1: ‍ U+200D	ZERO WIDTH JOINER
// 2: 👩 U+1F469	WOMAN
// 3: ‍ U+200D	ZERO WIDTH JOINER
// 4: 👧 U+1F467	GIRL
// 5: ‍ U+200D	ZERO WIDTH JOINER
// 6: 👧 U+1F467	GIRL
```

### Stderr Output Stream

Text output streams can also be used to
direct print statements from the default `stdout` destination.
In this example,
the `print` function is directed to write to `stderr`.

```swift
var standardError = StderrOutputStream()
print("Error!", to: &standardError)
```

### Booking Class

Swift allows any type that conforms to `ExpressibleByStringLiteral`
to be initialized from a string literal.
This Playground provides a simple example through the `BookingClass` type.

```swift
("J" as BookingClass) // Business Class
```

### Flight Code

Types conforming to the `LosslessStringConvertible` protocol
can be initialized directly from `String` values.
This Playground shows a `FlightCode` type that is adopts both
the `LosslessStringConvertible` and `ExpressibleByStringLiteral` protocols.

```swift
let flight: FlightCode = "AA 1"

flight.airlineCode
flight.flightNumber

FlightCode(String(flight))
```

### Unicode Styling

Swift 5 makes it possible to customize
the behavior of interpolation in string literals
by way of the `ExpressibleByStringInterpolation` protocol.
To demonstrate this,
we implement a `StyledString` type that
allows interpolation segments to specify a style,
such as **bold**, _italic_, and 𝔣𝔯𝔞𝔨𝔱𝔲𝔯.

```swift
let name = "Johnny"
let styled: StyledString = """
Hello, \(name, style: .fraktur(bold: true))!
"""

print(styled)
```

## Chapter 4

### Range Conversion

Objective-C APIs that take `NSString` parameters
or have `NSString` return values
are imported by Swift to use `String` values instead.
However, some of these APIs still specify ranges using the `NSRange` type
instead of `Range<String.Index>`.
This Playground demonstrates how to convert back and forth
between the two range types.

```swift
import Foundation

let string = "Hello, world!"
let nsRange = NSRange(string.startIndex..<string.endIndex, in: string)
let range = Range(nsRange, in: string)
```

### Localized String Operations

Foundation augments the Swift `String` type
by providing localized string operations,
including
case mapping,
searching,
and comparison.
Be sure to use localized string operations
(ideally the `standard` variant, if applicable)
when working with text written or read by users.

```swift
import Foundation

"Éclair".contains("E") // false
"Éclair".localizedStandardContains("E") // true
```

### Numeric String Sorting

Another consideration for localized string sorting is how to handle numbers.
By default, strings sort digits lexicographically;
7 follows 3, but 7 also follows 36.
This Playground demonstrates proper use of the
`localizedStandardCompare` comparator,
which is what Finder uses to sort filenames.

```swift
import Foundation

let files: [String] = [
    "File 3.txt",
    "File 7.txt",
    "File 36.txt"
]

let order: ComparisonResult = .orderedAscending

files.sorted { lhs, rhs in
    lhs.localizedStandardCompare(rhs) == order
}
// ["File 3.txt", "File 7.txt", "File 36.txt"]
```

### Normalization Forms

Foundation provides APIs for accessing normalization forms for strings,
including NFC and NFD,
as demonstrated in this example.

```swift
import Foundation

let string = "ümlaut"

let nfc = string.precomposedStringWithCanonicalMapping
nfc.unicodeScalars.first

let nfd = string.decomposedStringWithCanonicalMapping
nfd.unicodeScalars.first
```

### String Encoding Conversion

Foundation offers support for many different legacy string encodings,
as shown in this example.

```swift
import Foundation

"Hello, Macintosh!".data(using: .macOSRoman)
```

### String from Data

Foundation provides APIs to read and write `String` values
from data values and files.

```swift
import Foundation

let url = Bundle.main.url(forResource: "file", withExtension: "txt")!
try String(contentsOf: url) // "Hello!"

let data = try Data(contentsOf: url)
String(data: data, encoding: .utf8) // "Hello!"
```

### String Transformation

Another cool bit of functionality `String` inherits from `NSString`
is the ability to apply
[ICU string transforms](http://userguide.icu-project.org/transforms/general),
as seen in this example.

```swift
import Foundation

"Avión".applyingTransform(.stripDiacritics, reverse: false)
// "Avion"

"©".applyingTransform(.toXMLHex, reverse: false)
// "&#xA9;"

"🛂".applyingTransform(.toUnicodeName, reverse: false)
// "\\N{PASSPORT CONTROL}"

"マット".applyingTransform(.fullwidthToHalfwidth, reverse: false)
// "ﾏｯﾄ"
```

### Trimming

Foundation's `CharacterSet` is used in various string APIs,
but it's perhaps most well-known for its role in the
`trimmingCharacters(in:)` method,
as shown in this Playground.

```swift
import Foundation

"""

            ✈️

""".trimmingCharacters(in: .whitespacesAndNewlines) // "✈️"
```

### URL Encoding

Only certain characters are allowed in certain positions of a URLs.
By importing Foundation,
you can encode URL query parameters with confidence
with the `addingPercentEncoding(withAllowedCharacters:)` method.

```swift
import Foundation

"q=lax to jfk".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
// q=lax%20to%20jfk
```

### String Format

When you import the Foundation framework,
`String` gets `sprintf`-style initializers.
This Playground serves as an exhaustive reference
for all of the available
formatting specifiers, modifiers, flags, and arguments.

```swift
import Foundation

String(format: "%X", 127) // "7F"
```

## Chapter 5

### Base2 and Base16 Encoding

These examples show you how to
use the `String(_:radix:uppercase:)` initializer to
produce binary and hexadecimal representations of binary integer values.

```swift
let byte: UInt8 = 0xF0

String(byte, radix: 2) // "11110000"
String(byte, radix: 16, uppercase: true) // "F0"
```

### Base64 Encoding

Foundation provides APIs for base64 encoding and decoding data,
which are demonstrated in this Playground.

```swift
import Foundation

let string = "Hello!"

let data = string.data(using: .utf8)!
let encodedString = data.base64EncodedString() // "SGVsbG8h"
```

### Base🧑 Encoding

Anticipating emoji's role in the forthcoming collapse of human communication,
we present a novel binary-to-text encoding format
that represents data using human face emoji
combined with skin tone and hair style modifiers.

```swift
let data = "Fly".data(using: .utf8)!
let encodedString = data.base🧑EncodedString() // "👨🏽‍🦱👩🏻‍🦲👩🏽‍🦳👩🏿‍🦱"
```

### Human Readable Encoding

In this example,
we implement the 11-bit binary-to-text encoding described in
[RFC 1751](https://tools.ietf.org/html/rfc1751):
"A Convention for Human-Readable 128-bit Keys".
_"Why?"_ you ask?
_Why indeed!_

```swift
import Foundation

let data = Data(bytes: [0xB2, 0x03, 0xE2, 0x8F,
                        0xA5, 0x25, 0xBE, 0x47])

data.humanReadableEncodedString()
// "LONG IVY JULY AJAR BOND LEE"
```

## Chapter 6

### Parsing with Scanner

One of Foundation's many offerings is the `Scanner` class:
a sort of lexer/parser combo deal with some convenient features.
This Playground demonstrates how to make it even more convenient in Swift,
and how to use it to parse information from an AFTN message.

```swift
import Foundation

let scanner = Scanner(string: string)
scanner.charactersToBeSkipped = .whitespacesAndNewlines

try scanner.scan("ZCZC")
let transmission = try scanner.scan(.alphanumerics)
let additionalServices = try scanner.scan(.decimalDigits)
let priority = try scanner.scan(.uppercaseLetters)
let destination = try scanner.scan(.uppercaseLetters)
let time = try scanner.scan(.decimalDigits)
let origin = try scanner.scan(.uppercaseLetters)
let text = try scanner.scan(upTo: "NNNN")
```

### Parsing with Regular Expressions

Foundation's `NSRegularExpression` offers the closest thing to
built-in regex support in Swift.
Underneath the hood, it wraps the
[ICU regular expression engine](http://userguide.icu-project.org/strings/regexp);
we take advantage of a bunch of its advanced features in this Playground
to parse the same message as before using a different approach.

```swift
import Foundation

let pattern = #"""
(?x-i)
\A
ZCZC \h
(?<transmission>[A-Z]{3}[0-9]{3}) \h (?<additionalService>[0-9]{0,8}) \n
(?<priority>[A-Z]{2}) \h (?<destination>[A-Z]{8}) \n
(?<time>[0-9]{6}) \h (?<origin>[A-Z]{8}) \n+
(?<text>[[A-Z][0-9]\h\n]+) \s*
NNNN
\Z
"""#

let regex = try NSRegularExpression(pattern: pattern,
                                    options: [])
```

### Parsing with ANTLR4

[ANTLR](https://www.antlr.org) is a parser generator
with support for Swift code generation.
This example provides a working integration between ANTLR4
and the Swift Package Manager to demonstrate yet another approach
to parsing the same AFTN message from the previous examples.

```swift
import AFTN

let message = try Message(string)!
message.priority
message.destination.location
message.destination.organization
message.destination.department
message.filingTime
message.text
```

## Chapter 7

### Tokenization

The NaturalLanguage framework's `NLTokenizer` class
can tokenize text by word, sentence, and paragraph,
as demonstrated in this example.

```swift
import NaturalLanguage

let string = "Welcome to New York, where the local time is 9:41 AM."
let tokenizer = NLTokenizer(unit: .word)
tokenizer.string = string

let stringRange = string.startIndex..<string.endIndex
tokenizer.enumerateTokens(in: stringRange) { (tokenRange, _) in
    let token = string[tokenRange]
    print(token, terminator: "\t")
    return true // continue processing
}
// Prints: "Welcome	to	New	York	where	the	local	time	is	9	41	AM	"
```

### Language Tagging

You can use the `NLTagger` class to detect the language and script
for a piece of natural language text,
as seen in this Playground.

```swift
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
        print(scheme.rawValue, tag.rawValue)
    }
}
// Prints:
// "Language de"
// "Script Latn"
```

### Part of Speech Tagging

To tag part of speech for words (noun, verb, etc.)
use the `NLTagger` class with the `.lexicalClass` tag scheme.

```swift
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
// Prints:
// "The: Determiner"
// "sleek: Adjective"
// "white: Adjective"
// "jet: Noun"
// ...
```

### Named Entity Recognition

`NLTagger` can also be used to detect named entities,
including people, places, and organizations.
This example shows how to do just that.

```swift
import NaturalLanguage

let string = """
Fang Liu of China is the current Secretary General of ICAO.
"""

let tagger = NLTagger(tagSchemes: [.nameType])
tagger.string = string

let stringRange = string.startIndex..<string.endIndex

let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
tagger.enumerateTags(in: stringRange,
                     unit: .word,
                     scheme: .nameType,
                     options: options) { (tag, tagRange) in
    if let nameType = tag?.rawValue, tag != .otherWord {
        print("\(string[tagRange]): \(nameType)")
    }

    return true // continue processing
}
// Prints:
// "Fang Liu: PersonalName"
// "China: PlaceName"
// "ICAO: OrganizationName"
```

### Keyword Extraction

Short of implementing a more complete natural language parser,
you can use `NLTagger` to extract keywords by part of speech
as a first approximation for interpreting commands.

```swift
import NaturalLanguage

let string = "What's the current temperature in Tokyo?"

let tagger = NLTagger(tagSchemes: [.nameTypeOrLexicalClass])
tagger.string = string

var taggedKeywords: [(NLTag, String)] = []

let stringRange = string.startIndex..<string.endIndex
let options: NLTagger.Options = [.omitWhitespace,
                                 .omitPunctuation,
                                 .joinNames]
tagger.enumerateTags(in: stringRange,
                     unit: .word,
                     scheme: .nameTypeOrLexicalClass,
                     options: options) { (tag, tagRange) in
    guard let tag = tag else { return true }
    switch tag {
    case .noun, .placeName:
        print(tag.rawValue, String(string[tagRange]))
    default:
        break
    }

    return true // continue processing
}
// Prints:
// "Noun temperature"
// "PlaceName Tokyo"
```

### Lemmatization

This example demonstrates the `.lemma` tag scheme
and how it resolves conjugations of various words.

```swift
import NaturalLanguage

let string = """
Flying flights fly flyers flown.
"""

let tagger = NLTagger(tagSchemes: [.lemma])
tagger.string = string

tagger.enumerateTags(in: string.startIndex..<string.endIndex,
                     unit: .word,
                     scheme: .lemma,
                     options: []) { (tag, tagRange) in
    if let lemma = tag?.rawValue {
        print("\(string[tagRange]): \(lemma)")
    }

    return true // continue processing
}
// Prints:
// "Flying: fly"
// "flights: flight"
// "fly: fly"
// "flyers: flyer"
// "flown: fly"
```

### Language Recognizer

The `NLLanguageRecognizer` provides a configurable classifier
for determining the language used in a piece of text.
Here, we demonstrate how to use the `languageHints` property
to resolve a sentence that could be understood in either
Norwegian Bokmål (`nb`) or Danish (`da`).

```swift
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
```

### Naive Bayes Classifier

This example provides a reference implementation for a
Naive Bayes "bag of words" classifier in Swift.

```swift
enum Sentiment: String, Hashable {
    case positive, negative
}

let classifier = NaiveBayesClassifier<Sentiment, String>()
classifier.trainText("great flight", for: .positive)
classifier.trainText("flight was late and turbulent", for: .negative)

classifier.classifyText("I had a great flight") // positive
```

### Sentiment Classification

Using Create ML, we can build a Core ML classifier model
that can be used by the Natural Language framework
to determine if a piece of natural language text expresses
positive, negative, or neutral sentiment.

```swift
import NaturalLanguage

let url = Bundle.main.url(forResource: "SentimentClassifier",
                          withExtension: "mlmodelc")!
let model = try NLModel(contentsOf: url)

model.predictedLabel(for: "Nice, smooth flight") // positive
```

### N-Grams

This Playground provides a Swift implementation of n-grams,
which, combined with `NLTokenizer`,
can produce bigrams and trigrams of words in a piece of natural language text.

```swift
import NaturalLanguage

let string = """
Please direct your attention to flight attendants
as we review the safety features of this aircraft.
"""

let tokenizer = NLTokenizer(unit: .word)
tokenizer.string = string
let words = tokenizer.tokens(for: string.startIndex..<string.endIndex)
                     .map { String(string[$0]) }
bigrams(words)
// [("Please", "direct"), ("direct", "your"), ...]
```

### Markov Chain

Using n-grams to determine the conditional probability of
transitions from one word to another,
we can construct a model that randomly generates text
that trivially resembles the provided source.
In this example,
we feed in a corpus of Air Traffic Control transcripts.

```swift
import Foundation
import NaturalLanguage

// https://catalog.ldc.upenn.edu/LDC94S14A
let url = Bundle.main.url(forResource: "LDC94S14A-sample",
                          withExtension: "txt")!
let text = try String(contentsOf: url)
var markovChain = MarkovChain(sentencesAndWords(for: text))

for word in markovChain {
    print(word, terminator: " ")
}

// Prints: "CACTUS EIGHT OH EIGHT TURN LEFT HEADING ONE SEVENTY HEAVY"
```

### Soundex

Soundex is a classic phonetic coding system
used to resolve ambiguity in the spelling of surnames.
This example provides a Swift implementation of the standard algorithm.

```swift
let names: [String] = [
    "Washington",
    "Lee",
    "Smith",
    "Smyth"
]

for name in names {
    print("\(name): \(soundex(name))")
}
// Prints:
// "Washington: W252"
// "Lee: L000"
// "Smith: S530"
// "Smyth: S530"
```

### Levenshtein Distance

You can use a string metric like Levenshtein edit distance
to quantify the similarity between two sequences.

```swift
/*
 |     |     |  S  |  a  |  t  |  u  |  r  |  d  |  a  |  y  |
 |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
 |     | _0_ |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |
 |   S |  1  | _0_ | _1_ | _2_ |  3  |  4  |  5  |  6  |  7  |
 |   u |  2  |  1  |  1  |  2  | _2_ |  3  |  4  |  5  |  6  |
 |   n |  3  |  2  |  2  |  2  |  3  | _3_ |  4  |  5  |  6  |
 |   d |  4  |  3  |  3  |  3  |  3  |  4  | _3_ |  4  |  5  |
 |   a |  5  |  4  |  3  |  4  |  4  |  4  |  4  | _3_ |  4  |
 |   y |  6  |  5  |  4  |  4  |  5  |  5  |  5  |  4  | _3_ |
*/
levenshteinDistance(from: "Saturday", to: "Sunday") // 3
```

### Spell Checker

Using the Levenshtein distance function from the previous example,
and combining it with a corpus of frequently-used words,
you can create a reasonably effective spell checker
with very little additional code.

```swift
import Foundation

// https://catalog.ldc.upenn.edu/LDC2006T13
guard let url = Bundle.main.url(forResource: "LDC2006T13-sample",
                                withExtension: "txt")
else {
    fatalError("Missing required resource")
}

let spellChecker = try SpellChecker(contentsOf: url)

spellChecker.suggestions(for: "speling")
// ["spelling", "spewing", "sperling"]
```

---

## License

MIT

## About Flight School

Flight School is a book series for advanced Swift developers
that explores essential topics in iOS and macOS development
through concise, focused guides.

If you'd like to get in touch,
feel free to [message us on Twitter](https://twitter.com/flightdotschool)
or email us at <info@flight.school>.

[build status]: https://travis-ci.org/Flight-School/Guide-to-Swift-Strings-Sample-Code
[build status badge]: https://api.travis-ci.com/Flight-School/Guide-to-Swift-Strings-Sample-Code.svg?branch=master
[license]: http://img.shields.io/badge/license-MIT-blue.svg?style=flat
[license badge]: http://img.shields.io/badge/license-MIT-blue.svg?style=flat
[swift version]: https://swift.org/download/
[swift version badge]: http://img.shields.io/badge/swift%20version-5.0-orange.svg?style=flat
