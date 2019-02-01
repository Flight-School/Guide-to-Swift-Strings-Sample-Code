public enum BookingClass: String {
    case firstClass = "F"
    case businessClass = "J"
    case premiumEconomy = "W"
    case economy = "Y"
}

extension BookingClass: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)!
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }
}

extension BookingClass: CustomStringConvertible {
    public var description: String {
        switch self {
        case .firstClass:
            return "First Class"
        case .businessClass:
            return "Business Class"
        case .premiumEconomy:
            return "Premium Economy"
        case .economy:
            return "Economy"
        }
    }
}
