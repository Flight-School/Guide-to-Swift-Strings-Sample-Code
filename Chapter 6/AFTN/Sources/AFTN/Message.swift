/// An Aeronautical Fixed Telecommunication Network (AFTN) Message
public struct Message: Equatable, Codable {

    /// The message priority.
    public enum Priority: String, Equatable, Hashable, Codable {
        /// Distress Messages
        case distress = "SS"

        /// Urgency Messages
        case urgency = "DD"

        /// Flight Safety Messages
        case safety = "FF"

        /// Meteorological Messages, Flight Regularity Messages and Aeronautical Information Services Messages
        case information = "GG"

        /// Aeronautical Administrative Messages
        case administrative = "KK"
    }

    public struct Address: Equatable, Hashable, Codable {
        /// A department within an organization.
        public enum Department: String, Equatable, Hashable, Codable {
            /// Engineering (E)
            case engineering = "E"

            /// Freight or Cargo (F)
            case freight = "F"

            /// Catering (H)
            case catering = "H"

            /// Stores and Supplies (J)
            case supplies = "J"

            /// Airport Station Services (K)
            case airportStationServices = "K"

            /// Lost and Found (L)
            case lostAndFound = "L"

            /// Maintenance (M)
            case maintenance = "M"

            /// Flight Operations (O)
            case flightOperations = "O"

            /// Passenger Handling (P)
            case passengerHandling = "P"

            /// Reservations (R)
            case reservations = "R"

            /// Schedules Planning (U)
            case schedulesPlanning = "U"

            /// Operations Control (W)
            case operationsControl = "W"

            /// Unspecified (X)
            case unspecified = "X"
        }

        /// An indicator for the addressed location.
        public let location: String

        /// An indicator for the addressed organization.
        public let organization: String

        /// An indicator for the department within the addressed organization.
        public let department: Department

        public init(location: String, organization: String, department: Department = .unspecified) {
            self.location = location
            self.organization = organization
            self.department = department
        }
    }

    /// The transmission indicator.
    public let transmission: String

    /// An additional service indicator.
    public let additionalService: String?

    /// The message priority.
    public let priority: Priority

    /// The message destination.
    public let destination: Address

    private let filingDay: Int
    private let filingHour: Int
    private let filingMinute: Int

    /// The time at which the message was filed.
    public var filingTime: (day: Int, hour: Int, minute: Int) {
        return (self.filingDay, self.filingHour, self.filingMinute)
    }

    /// The message origin.
    public let origin: Address

    /// The text of the message.
    public let text: String

    /// Initializes a message with the specified components.
    public init(transmission: String,
                additionalService: String? = nil,
                priority: Priority,
                destination: Address,
                filingTime: (day: Int, hour: Int, minute: Int),
                origin: Address,
                text: String)
    {
        self.transmission = transmission
        self.additionalService = additionalService
        self.priority = priority
        self.destination = destination
        self.filingDay = filingTime.day
        self.filingHour = filingTime.hour
        self.filingMinute = filingTime.minute
        self.origin = origin
        self.text = text
    }
}

extension Message.Priority: CustomStringConvertible {
    public var description: String {
        return self.rawValue
    }
}

/// Messages are transmitted in order of their priority,
/// such that messages with SS priority are transmitted first,
/// followed by messages with DD or FF priority,
/// and then finally messages with GG or KK priority.
extension Message.Priority: Comparable {
    private var orderOfPriority: Int {
        switch self {
        case .distress: return 1
        case .urgency, .safety: return 2
        case .information, .administrative: return 3
        }
    }

    public static func <(lhs: Message.Priority, rhs: Message.Priority) -> Bool {
        return lhs.orderOfPriority > rhs.orderOfPriority
    }
}

extension Message.Priority: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)!
    }

    public init(extendedGraphemeClusterLiteral value: Character) {
        fatalError()
    }

    public init(unicodeScalarLiteral value: Unicode.Scalar) {
        fatalError()
    }
}

extension Message.Address.Department: CustomStringConvertible {
    public var description: String {
        return self.rawValue
    }
}

extension Message.Address.Department: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self = .unspecified
    }
}

extension Message.Address.Department: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)!
    }

    public init(extendedGraphemeClusterLiteral value: Character) {
        fatalError()
    }

    public init(unicodeScalarLiteral value: Unicode.Scalar) {
        fatalError()
    }
}
