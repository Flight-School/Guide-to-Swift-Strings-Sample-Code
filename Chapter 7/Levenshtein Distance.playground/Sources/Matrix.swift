public struct Matrix {
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
