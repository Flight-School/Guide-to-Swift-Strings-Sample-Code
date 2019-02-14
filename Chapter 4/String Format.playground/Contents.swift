import Foundation

// =====================
// Conversion Specifiers
// =====================

// Integers
// --------

// %d - Signed 32-bit decimal integer
String(format: "%d", 123)
String(format: "%d", -123)

// %u - Unsigned 32-bit decimal integer
String(format: "%u", 123)
String(format: "%u", -123)

// %x - Unsigned 32-bit hexadecimal integer using lowercase digits (0-9, a-f)
String(format: "%x", 127)

// %X - Unsigned 32-bit hexadecimal integer using uppercase digits (0-9, A-F)
String(format: "%X", 127)

// %o - Unsigned 32-bit octal integer
String(format: "%o", 484)


// Floating-Point Numbers
// ----------------------

// %f - 64-bit floating-point
// using lowercase for inf, infinity, and nan
String(format: "%f", 1234.56)
String(format: "%f", Double.nan)

// %F - 64-bit floating-point
// using uppercase for INF, INFINITY, and NAN
String(format: "%F", 1234.56)
String(format: "%F", Double.nan)

// %e - 64-bit floating-point in scientific notation
// using a lowercase e to introduce the exponent
String(format: "%e", 1234.56)

// %E - 64-bit floating-point in scientific notation
// using a capital E to introduce the exponent
String(format: "%E", 1234.56)

// %g - 64-bit floating-point formatted
// in scientific notation using a lowercase e to introduce the exponent
// if the exponent is less than –4 or if it's greater than the precision;
// otherwise as a floating-point decimal number
String(format: "%g", 0.0001234)
String(format: "%g", 0.00001234)

// %G - 64-bit floating-point formatted
// in scientific notation using a capital E to introduce the exponent
// if the exponent is less than –4 or if it's greater than the precision;
// otherwise as a floating-point decimal number
String(format: "%G", 0.0001234)
String(format: "%G", 0.00001234)

// %a - 64-bit floating-point in hexadecimal scientific notation
// with a leading 0x using a lowercase p to introduce the exponent
String(format: "%a", 0xA.1p3)

// %A - 64-bit floating-point in hexadecimal scientific notation
// with a leading 0X using an uppercase P to introduce the exponent
String(format: "%A", 0xA.1p3)


// Characters and Strings
// ----------------------

// %c - UTF-8 code unit
String(format: "%c", 0x41)

// %C - UTF-16 code unit
String(format: "%C", 0x3042)

// %@ - String
String(format: "%@", "Hello")

// %% - Percent sign
String(format: "%d%%", 100)


// ================
// Length Modifiers
// ================

// Modifiers following integer specifiers (d, o, u, x, X)
// ------------------------------------------------------

// hh - signed or unsigned char (8 bits in size)
String(format: "%hhu", Int(UInt8.max))
String(format: "%u", Int(UInt8.max) + 1)
String(format: "%hhu", Int(UInt8.max) + 1)

// h - short signed or unsigned integer (at least 16 bits in size)
String(format: "%hd", Int(Int16.max))
String(format: "%d", Int(Int16.max) + 1)
String(format: "%hd", Int(Int16.max) + 1)

// l - long signed or unsigned integer (at least 32 bits in size)
String(format: "%ld", Int(Int32.max))
String(format: "%d", Int(Int32.max) + 1)
String(format: "%ld", Int(Int32.max) + 1)

// ll, q - long long signed or unsigned integer (at least 64 bits in size)
String(format: "%d", Int.max)
String(format: "%lld", Int.max)


// Modifiers following floating-point specifiers (a, A, e, E, f, F, g, G)
// ----------------------------------------------------------------------

// L - long double (at least 80 bits in size)
String(format: "%LF", Float80(6.02214086e23))


// ================
// Formatting Flags
// ================

// Zero Padding (0)
// ----------------

// For integer and floating-point formats,
// leading zeroes pad to the specified width
String(format: "%04d", 1)
String(format: "%02X", 0x0F)

// Left Justification (-)
// ----------------------

// The result is left-justified with spaces to the specified width
String(format: "%-5d", 10)

// Signedness (+)
// --------------

// Numbers have explicit + or - sign, even when positive
String(format: "%+d", 1)
String(format: "%+d", -1)
String(format: "%d", 1)


// Alternative Forms (#)
// ---------------------

// For octal integer specifiers (o),
// the first digit of the result is a zero leading
String(format: "%#o", 0o744)
String(format: "%o", 0o744)

// For hexadecimal integer specifiers (x, X),
// 0x or 0X is prepended
String(format: "%#X", 0xF7)
String(format: "%X", 0xF7)

// For floating-point specifiers (a, A, e, E, f, F, g, G),
// result always contains radix / decimal point
String(format: "%#f", 123.0)
String(format: "%f", 123.0)

// For conditional floating-point specifiers (g, G),
// trailing zeroes aren't removed as they would otherwise
String(format: "%#g", 123.0)
String(format: "%g", 123.0)


// ===============
// Locale Argument
// ===============

let 🇺🇸 = Locale(identifier: "en_US")
let 🇫🇷 = Locale(identifier: "fr_FR")

String(format: "%f", locale: 🇺🇸, 12345.67)
String(format: "%f", locale: 🇫🇷, 12345.67)

let 🇸🇪 = Locale(identifier: "sv_SE")
let 🇪🇬 = Locale(identifier: "ar_EG")

String(format: "%e", locale: 🇺🇸, 12345.67)
String(format: "%e", locale: 🇸🇪, 12345.67)
String(format: "%e", locale: 🇪🇬, 12345.67)

NumberFormatter.localizedString(from: 12345.67, number: .decimal)
NumberFormatter.localizedString(from: 12345.67, number: .scientific)
NumberFormatter.localizedString(from: 12345.67, number: .currency)
