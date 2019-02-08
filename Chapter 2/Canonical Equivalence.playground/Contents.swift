let precomposed = "expos\u{00E9}" // é LATIN SMALL LETTER E WITH ACUTE
let decomposed = "expose\u{0301}" // ´ COMBINING ACUTE ACCENT

precomposed == decomposed
precomposed.elementsEqual(decomposed)

precomposed.unicodeScalars.elementsEqual(decomposed.unicodeScalars)
