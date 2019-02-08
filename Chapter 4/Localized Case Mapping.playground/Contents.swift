import Foundation

let 🇹🇷 = Locale(identifier: "tr_TR") // Turkey

"İ".lowercased(with: 🇹🇷) // "i"
"İ".lowercased() // "i̇"

let 🇱🇹 = Locale(identifier: "lt_LT") // Lithuania

"i̇̀".uppercased(with: 🇱🇹) // Ì
"i̇̀".uppercased() // İ̀
