do {
    var string = "plane"
    string.append("s")
    
    let index = string.index(string.endIndex, offsetBy: -1)
    string.insert("t", at: index)
}

do {
    var string = "international concourse"
    string.removeFirst(5)
    string.removeLast(6)
    
    let index = string.lastIndex(of: " ")!
    string.remove(at: index)
    
    let range = string.firstIndex(of: "o")!..<string.lastIndex(of: "o")!
    string.removeSubrange(range)
}


do {
    var string = "lost baggage"
    let index = string.firstIndex(of: " ")!
    string.replaceSubrange(..<index, with: "found")
    // "found baggage"
}
