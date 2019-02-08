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

struct Matrix {
    public let rows: Int
    public let columns: Int
    
    private var grid: [Int]
    
    public init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.grid = [Int](repeating: 0, count: rows * columns)
    }
    
    public subscript(row: Int, column: Int) -> Int {
        get {
            precondition(row <= rows && column <= columns)
            return grid[(row * columns) + column]
        }
        
        set {
            precondition(row <= rows && column <= columns)
            grid[(row * columns) + column] = newValue
        }
    }
}
