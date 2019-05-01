#if canImport(AppKit)
import AppKit

let name = NSFullUserName()
let styled: StyledString = """
Hello, \(name, style: .fraktur(bold: true))!
"""

print(styled)
#endif

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
