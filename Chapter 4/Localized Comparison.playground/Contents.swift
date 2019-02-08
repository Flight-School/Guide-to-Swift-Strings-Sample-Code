import Foundation

let cities: [String] = [
    "Albuquerque",
    "Ålesund",
    "Östersund",
    "Reno",
    "Tallahassee"
]

let 🇺🇸 = Locale(identifier: "en_US")
let 🇸🇪 = Locale(identifier: "sv_SE")

let order: ComparisonResult = .orderedAscending

cities.sorted { lhs, rhs in
    lhs.compare(rhs, options: [], range: nil, locale: 🇺🇸) == order
}

cities.sorted { lhs, rhs in
    lhs.compare(rhs, options: [], range: nil, locale: 🇸🇪) == order
}

