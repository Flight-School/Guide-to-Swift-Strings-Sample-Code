import Foundation

let string = "ümlaut"

let nfc = string.precomposedStringWithCanonicalMapping
nfc.unicodeScalars.first

let nfd = string.decomposedStringWithCanonicalMapping
nfd.unicodeScalars.first
