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
