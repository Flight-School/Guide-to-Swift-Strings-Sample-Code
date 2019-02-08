import Foundation

extension Scanner {
    public struct Error: Swift.Error {
        let location: Int
        
        var localizedDescription: String {
            return "scan failure at location: \(location)"
        }
    }
    
    @discardableResult
    public func scan(_ string: String) throws -> String {
        var result: NSString?
        guard scanString(string, into: &result),
              case let string? = (result as String?)
        else {
            throw Error(location: self.scanLocation)
        }
        
        return string
    }
    
    public func scan(_ characters: CharacterSet) throws -> String {
        var result: NSString?
        guard scanCharacters(from: characters, into: &result),
            case let string? = (result as String?)
        else {
            throw Error(location: self.scanLocation)
        }
        
        return string
    }
    
    public func scan(upTo string: String) throws -> String {
        var result: NSString?
        guard scanUpTo(string, into: &result),
            case let string? = (result as String?)
        else {
            throw Error(location: self.scanLocation)
        }
        
        return string
    }
    
    public func scan(upTo characters: CharacterSet) throws -> String {
        var result: NSString?
        guard scanUpToCharacters(from: characters, into: &result),
            case let string? = (result as String?)
        else {
            throw Error(location: self.scanLocation)
        }
        
        return string
    }
    
    public func scan<T>(_ type: T.Type) throws -> T where T: BinaryInteger {
        switch type {
        case is Int32.Type:
            return try scan(Scanner.scanInt32) as! T
        case is Int64.Type:
            return try scan(Scanner.scanInt64) as! T
        case is UInt64.Type:
            return try scan(Scanner.scanUnsignedLongLong) as! T
        default:
            guard let value = T(exactly: try scan(Scanner.scanInt)) else {
                throw Error(location: self.scanLocation)
            }
            
            return value
        }
    }
    
    public func scan(_ type: Float.Type) throws -> Float {
        return try scan(Scanner.scanFloat)
    }
    
    public func scan(_ type: Double.Type) throws -> Double {
        return try scan(Scanner.scanDouble)
    }
    
    public func scan(_ type: Decimal.Type) throws -> Decimal {
        return try scan(Scanner.scanDecimal)
    }
    
    public func scan<T>(hexadecimal type: T.Type) throws -> T where T: BinaryInteger {
        switch type {
        case is Int32.Type:
            return try scan(Scanner.scanHexInt32) as! T
        case is Int64.Type:
            return try scan(Scanner.scanHexInt64) as! T
        default:
            guard let value = T(exactly: try scan(Scanner.scanHexInt64)) else {
                throw Error(location: self.scanLocation)
            }
            
            return value
        }
    }
    
    public func scan(hexadecimal type: Float.Type) throws -> Float {
        return try scan(Scanner.scanHexFloat)
    }
    
    public func scan(hexadecimal type: Double.Type) throws -> Double {
        return try scan(Scanner.scanHexDouble)
    }
    
    private typealias Scan<T> = (Scanner) -> ((UnsafeMutablePointer<T>?) -> Bool)
    
    private func scan<T>(_ partial: Scan<T>) throws -> T {
        let pointer = UnsafeMutablePointer<T>.allocate(capacity: MemoryLayout<T>.stride)
        defer { pointer.deallocate() }
        
        guard partial(self)(pointer) else {
            throw Error(location: self.scanLocation)
        }
        
        return pointer.pointee
    }
}
