public struct BigramSequence<Element>: Sequence, IteratorProtocol {
    private var i1: AnyIterator<Element>
    private var i2: AnyIterator<Element>
    
    public init<S: Sequence>(_ sequence: S) where S.Element == Element {
        self.i1 = AnyIterator<Element>(sequence.makeIterator())
        
        self.i2 = AnyIterator<Element>(sequence.makeIterator())
        _ = self.i2.next()
    }
    
    public mutating func next() -> (Element, Element)? {
        guard let first = self.i1.next(),
            let second = self.i2.next()
        else {
            return nil
        }
        
        return (first, second)
    }
}

public struct TrigramSequence<Element>: Sequence, IteratorProtocol {
    private var i1: AnyIterator<Element>
    private var i2: AnyIterator<Element>
    private var i3: AnyIterator<Element>

    public init<S: Sequence>(_ sequence: S) where S.Element == Element {
        self.i1 = AnyIterator<Element>(sequence.makeIterator())
        
        self.i2 = AnyIterator<Element>(sequence.makeIterator())
        _ = self.i2.next()
        
        self.i3 = AnyIterator<Element>(sequence.makeIterator())
        _ = self.i3.next()
        _ = self.i3.next()
    }
    
    public mutating func next() -> (Element, Element, Element)? {
        guard let first = self.i1.next(),
            let second = self.i2.next(),
            let third = self.i3.next()
            else {
                return nil
        }
        
        return (first, second, third)
    }
}

public func bigrams<S: Sequence>(_ sequence: S) -> BigramSequence<S.Element> {
    return BigramSequence(sequence)
}

public func trigrams<S: Sequence>(_ sequence: S) -> TrigramSequence<S.Element> {
    return TrigramSequence(sequence)
}
