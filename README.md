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
