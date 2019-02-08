import Foundation

extension FixedWidthInteger {
    public subscript(bit position: Int) -> Int? {
        guard position >= 0 && position < self.bitWidth else {
            return nil
        }
                
        return Int(self >> (self.bitWidth - position - 1) & 1)
    }
}

public struct BitSequence: Sequence, IteratorProtocol {
    private var base: Data.Iterator
    private var current: Data.Iterator.Element? = nil
    private var index: Int = 0
    
    public init(_ data: Data) {
        self.base = data.makeIterator()
        self.current = self.base.next()
    }
    
    public mutating func next() -> Int? {
        guard let current = self.current else {
            return nil
        }
        
        defer {
            self.index += 1
            
            if self.index == current.bitWidth {
                self.current = self.base.next()
                self.index = 0
            }
        }
        
        return current[bit: self.index]
    }
}

public struct MultiBitSequence: Sequence, IteratorProtocol {
    private var base: BitSequence.Iterator
    public let numberOfBits: Int
    
    public init(_ data: Data, numberOfBits: Int) {
        precondition(numberOfBits > 0 && numberOfBits <= Int.bitWidth)
        self.base = BitSequence(data).makeIterator()
        self.numberOfBits = numberOfBits
    }
    
    public mutating func next() -> Int? {
        var value: Int = 0
        
        for _ in 0..<self.numberOfBits {
            guard let bit = self.base.next() else {
                return nil
            }
            
            value = (value << 1) + bit
        }
        
        return value
    }
}
