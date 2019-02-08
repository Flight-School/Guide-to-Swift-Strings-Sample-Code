func levenshteinDistance<S1: Sequence,
                         S2: Sequence>
    (from sourceSequence: S1,
     to targetSequence: S2) -> Int
    where S1.Element: Equatable, S1.Element == S2.Element
{
    let source = Array(sourceSequence)
    let target = Array(targetSequence)
    
    var distance = Matrix(rows: source.count + 1,
                          columns: target.count + 1)
    
    for i in 1...source.count {
        distance[i, 0] = i
    }
    
    for j in 1...target.count {
        distance[0, j] = j
    }
    
    for i in 1...source.count {
        for j in 1...target.count {
            let δ = source[i - 1] == target[j - 1] ? 0 : 1
            distance[i, j] = min(
                distance[i, j - 1] + 1,     // insertions
                distance[i - 1, j] + 1,     // deletions
                distance[i - 1, j - 1] + δ  // substitutions
            )
        }
    }
    
    return distance[source.count, target.count]
}

/*
 |     |     |  S  |  a  |  t  |  u  |  r  |  d  |  a  |  y  |
 |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
 |     | _0_ |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |
 |   S |  1  | _0_ | _1_ | _2_ |  3  |  4  |  5  |  6  |  7  |
 |   u |  2  |  1  |  1  |  2  | _2_ |  3  |  4  |  5  |  6  |
 |   n |  3  |  2  |  2  |  2  |  3  | _3_ |  4  |  5  |  6  |
 |   d |  4  |  3  |  3  |  3  |  3  |  4  | _3_ |  4  |  5  |
 |   a |  5  |  4  |  3  |  4  |  4  |  4  |  4  | _3_ |  4  |
 |   y |  6  |  5  |  4  |  4  |  5  |  5  |  5  |  4  | _3_ |
*/
levenshteinDistance(from: "Saturday", to: "Sunday")

/*
 👨‍👩‍👧‍👦 = U+1F468   MAN
      U+200D    ZERO WIDTH JOINER
      U+1F469   WOMAN
      U+200D    ZERO WIDTH JOINER
      U+1F467   GIRL
      U+200D    ZERO WIDTH JOINER
      U+1F466   BOY

 👩‍👦‍👦 = U+1F469   WOMAN
      U+200D    ZERO WIDTH JOINER
      U+1F466   BOY
      U+200D    ZERO WIDTH JOINER
      U+1F466   BOY
*/

// Compare distance between characters vs. code points
levenshteinDistance(from: "👨‍👩‍👧‍👦", to: "👩‍👦‍👦")
levenshteinDistance(from: "👨‍👩‍👧‍👦".unicodeScalars,
                    to: "👩‍👦‍👦".unicodeScalars)

// You calculate the Levenshtein distance between any two equatable sequences
levenshteinDistance(from: ["SFO", "LAX", "JFK", "LHR"],
                    to: ["SFO", "DEN", "LHR"])

