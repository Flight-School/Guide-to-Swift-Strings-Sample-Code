do {
    var string = "expose"
    let newElement: Character = "\u{0301}"
    string.append(newElement) // "exposé"
    string.contains(newElement) // false
}

do {
    // é LATIN SMALL LETTER E WITH ACUTE
    let precomposed = "expos\u{00E9}"
    
    // e LATIN SMALL LETTER E +
    // ´ COMBINING ACUTE ACCENT
    let decomposed = "expose\u{0301}"
    
    precomposed == decomposed
}

do {
    let string = "Hi!"
    for (index, character) in zip(string.indices, string) {
        print(index.encodedOffset, character)
    }
}

do {
    let string = "Hello!"
    string.count
}
