struct BigramSequence<Element>: Sequence, IteratorProtocol {
    private var i1: AnyIterator<Element>
    private var i2: AnyIterator<Element>
    
    init<S: Sequence>(_ sequence: S) where S.Element == Element {
        self.i1 = AnyIterator<Element>(sequence.makeIterator())
        
        self.i2 = AnyIterator<Element>(sequence.makeIterator())
        _ = self.i2.next()
    }
    
    mutating func next() -> (Element, Element)? {
        guard let first = self.i1.next(),
            let second = self.i2.next()
            else {
                return nil
        }
        
        return (first, second)
    }
}

func bigrams<S: Sequence>(_ sequence: S) -> BigramSequence<S.Element> {
    return BigramSequence(sequence)
}
