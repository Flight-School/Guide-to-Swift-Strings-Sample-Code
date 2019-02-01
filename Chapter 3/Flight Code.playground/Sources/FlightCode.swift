public struct FlightCode {
    public let airlineCode: String
    public let flightNumber: Int
}

extension FlightCode: CustomStringConvertible {
    public var description: String {
        return "\(self.airlineCode) \(self.flightNumber)"
    }
}

extension FlightCode: LosslessStringConvertible {
    public init?(_ description: String) {
        let components = description.split(separator: " ")
        guard components.count == 2,
            let airlineCode = components.first,
            let number = components.last,
            let flightNumber = Int(number)
        else {
            return nil
        }
        
        self.airlineCode = String(airlineCode)
        self.flightNumber = flightNumber
    }
}

extension FlightCode: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)!
    }
}
