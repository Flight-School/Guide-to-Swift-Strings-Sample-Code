import NaturalLanguage

let announcements: [String] = [
    "Welcome to New York, where the local time is 9:41 AM.",
    "We're available 24/7 at 1 (800) FLY-5555 or online at fly.invalid.",
    "欢迎来到北京，当地时间是上午9:41。"
]

for string in announcements {
    let tokenizer = NLTokenizer(unit: .word)
    tokenizer.string = string
    
    let stringRange = string.startIndex..<string.endIndex
    tokenizer.enumerateTokens(in: stringRange) { (tokenRange, _) in
        let token = string[tokenRange]
        print(token, terminator: "\t")
        return true // continue processing
    }
    
    print()
}
