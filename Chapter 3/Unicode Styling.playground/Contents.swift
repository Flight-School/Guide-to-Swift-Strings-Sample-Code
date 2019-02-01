//------------------------------------------------------------------------------
// This playground requires Swift 5.0 or higher.
// You can download the latest Swift 5.0 Snapshot here:
// https://swift.org/download/#snapshots
//------------------------------------------------------------------------------

import AppKit

let name = NSFullUserName()
let styled: StyledString = """
Hello, \(name, style: .fraktur(bold: true))!
"""

print(styled)

// Equivalent
/*
let approximate = "Hello, \(name)!"
var interpolation =
    StyledString.StringInterpolation(
        literalCapacity: approximate.count,
        interpolationCount: 1
    )
interpolation.appendLiteral("Hello, ")
interpolation.appendInterpolation(
    name, style: .fraktur(bold: true)
)

let styled = StyledString(stringInterpolation: interpolation)
*/
