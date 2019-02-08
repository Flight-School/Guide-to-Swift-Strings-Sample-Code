let names: [String] = [
    "Washington",
    "Lee",
    "Smith",
    "Smyth"
]

for name in names {
    print("\(name): \(soundex(name))")
}
