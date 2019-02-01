do {
    let string = "Hello, again!"
    for character in string {
        print(character)
    }
}

do {
    let string = "Hello!"
    Array(string)
    String(Array(string))
}

do {
    "Boeing 737-800".filter { $0.isCased }
                    .map { $0.uppercased() }
}

do {
    let seats = "7A,7B,10F,13C"
    seats.split(separator: ",")
}

do {
    let isVowel: (Character) -> Bool = {
        "aeiouy".contains($0)
    }
    
    "pilot".first(where: isVowel)
}

do {
    "airport".prefix(3)
    "airport".prefix(while: { $0 != "r"})
}

do {
    let string = "ticket counter"
    string.dropFirst(7)
    string.dropLast(7)
    
    string.prefix(while: { $0 != " "})
    string.drop(while: { $0 != " "})
}
