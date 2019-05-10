#if canImport(PlaygroundSupport)
import PlaygroundSupport

extension Matrix: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        var output = ""

        for row in 0..<rows {
            for column in 0..<columns {
                output += "\(self[row, column])\t"
            }
            output += "\n"
        }

        return output
    }
}
#endif
