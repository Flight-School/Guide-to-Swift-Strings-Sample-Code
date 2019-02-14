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

---

## Chapter 2

### String Literals

You can construct string values in Swift using string literals.
This playground has examples of each variety,
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
This playground shows various strategies for
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
This playground shows the correspondence between
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
This playground provides a simple example through the `BookingClass` type.

```swift
("J" as BookingClass) // Business Class
```

### Flight Code

Types conforming to the `LosslessStringConvertible` protocol
can be initialized directly from `String` values.
This playground shows a `FlightCode` type that is adopts both
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
This playground demonstrates how to convert back and forth
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
This playground demonstrates proper use of the
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
This playground serves as an exhaustive reference
for all of the available
formatting specifiers, modifiers, flags, and arguments.

```swift
import Foundation

String(format: "%X", 127) // "7F"
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

```

```
