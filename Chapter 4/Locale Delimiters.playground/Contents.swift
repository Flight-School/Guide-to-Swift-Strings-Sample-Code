//------------------------------------------------------------------------------
// This playground requires Swift 5.0 or higher.
// You can download the latest Swift 5.0 Snapshot here:
// https://swift.org/download/#snapshots
//------------------------------------------------------------------------------

import Foundation

let doubleQuote: Unicode.Scalar = "\u{201C}" // “
let doubleAngle: Unicode.Scalar = "\u{00AB}" // «

doubleQuote.properties.generalCategory ==
    doubleAngle.properties.generalCategory // true

Locale.current.quotationBeginDelimiter

let angledQuotation = "«Bonjour!»"

let 🇫🇷 = Locale(identifier: "fr")
let 🇺🇸 = Locale(identifier: "en-US")

angledQuotation
    .replacingOccurrences(of: 🇫🇷.quotationBeginDelimiter!,
                          with: 🇺🇸.quotationBeginDelimiter!)
    .replacingOccurrences(of: 🇫🇷.quotationEndDelimiter!,
                          with: 🇺🇸.quotationEndDelimiter!) // “Bonjour!”
