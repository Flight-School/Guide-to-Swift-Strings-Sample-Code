import func Darwin.fputs
import var Darwin.stderr

public struct StderrOutputStream: TextOutputStream {
    public init() {}
    
    public mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

extension StderrOutputStream: CustomStringConvertible {
    public var description: String {
        return "StderrLogger"
    }
}
