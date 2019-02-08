import Foundation

let files: [String] = [
    "File 3.txt",
    "File 7.txt",
    "File 36.txt"
]

let order: ComparisonResult = .orderedAscending

let sortedWithCompare = files.sorted { lhs, rhs in
    lhs.compare(rhs) == order
}

print("Sorted with Compare: ", sortedWithCompare)

let sortedWithStandardCompare = files.sorted { lhs, rhs in
    lhs.localizedStandardCompare(rhs) == order
}

print("Sorted with Standard Compare: ", sortedWithStandardCompare)
