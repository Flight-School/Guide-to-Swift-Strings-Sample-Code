public struct MarkovChain<Element>: Sequence, IteratorProtocol where Element: Hashable {
    private var state: Element?
    private let transitions: [Element?: [Element?]]
    
    public init<S>(_ sequences: S) where S: Sequence, S.Element: Sequence, S.Element.Element == Element {
        var transitions: [Element?: [Element?]] = [:]
        for sequence in sequences {
            let paddedSequence = [nil] + Array(sequence) + [nil]
            for states in bigrams(paddedSequence) {
                transitions[states.0, default: []] += [states.1]
            }
        }
        self.transitions = transitions
    }
    
    public mutating func next() -> Element? {
        self.state = transitions[state]?.randomElement() ?? nil
        return self.state
    }
}
