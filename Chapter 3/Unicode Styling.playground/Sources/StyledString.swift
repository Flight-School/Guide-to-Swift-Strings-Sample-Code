public struct StyledString {
    private var components: [(String, Style)] = []
    
    public init() {}
    
    public init(_ value: String, style: Style = .none) {
        self.append(value, style: .none)
    }
    
    public mutating func append(_ string: String, style: Style) {
        self.components.append((string, style))
    }
}

extension StyledString: CustomStringConvertible {
    public var description: String {
        return components.reduce(into: "", { (result, component) in
            let (string, style) = component
            result.append(style.apply(to: string))
        })
    }
}

extension StyledString: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }
}

extension StyledString: ExpressibleByStringInterpolation {
    public init(stringInterpolation: StringInterpolation) {
        self.components = stringInterpolation.styledString.components
    }
    
    public struct StringInterpolation: StringInterpolationProtocol {
        public init(literalCapacity: Int, interpolationCount: Int) {
            styledString = StyledString()
        }
        
        fileprivate var styledString: StyledString
        
        public mutating func appendLiteral(_ literal: String) {
            styledString.append(literal, style: .none)
        }
        
        public mutating func appendInterpolation<T>(_ value: T) {
            styledString.append(String(describing: value), style: .none)
        }
        
        public mutating func appendInterpolation<T>(_ value: T, style: Style) {
            styledString.append(String(describing: value), style: style)
        }
    }
}
