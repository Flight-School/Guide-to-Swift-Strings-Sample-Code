let string = "Hello"

for character in string {
    print(character)
}

for (index, character) in zip(string.indices, string) {
    print(index.encodedOffset, character)
}

string[string.startIndex]
string[string.index(after: string.startIndex)]
string[string.index(string.startIndex, offsetBy: 4)]

string.firstIndex(of: "l")?.encodedOffset
string.lastIndex(of: "l")?.encodedOffset

let range = string.startIndex..<string.endIndex
string[range]

let index = string.index(after: string.startIndex)
string[...index]
string[..<index]
string[index...]

string[...]
