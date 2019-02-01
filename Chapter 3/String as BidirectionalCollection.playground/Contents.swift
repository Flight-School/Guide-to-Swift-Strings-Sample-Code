do {
    func isPalindrome(_ string: String) -> Bool {
        let normalized = string.filter { $0.isLetter }
                               .lowercased()
        return normalized.elementsEqual(normalized.reversed())
    }
    
    isPalindrome("I’m a fool; aloof am I.")
}

do {
    let isVowel: (Character) -> Bool = {
        "aeiouy".contains($0)
    }
    
    "pilot".last(where: isVowel)
}

do {
    "airport".suffix(4)
}
