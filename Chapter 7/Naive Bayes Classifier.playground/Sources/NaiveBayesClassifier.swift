import Darwin.libc

public class NaiveBayesClassifier<Category, Feature>
    where Category: Hashable, Feature: Hashable
{
    private var numberOfDocuments: Int = 0
    private var numberOfDocumentsByCategory: [Category: Int] = [:]

    private var featureCounts: [Feature: Int] = [:]
    private var featureCountsByCategory: [Category: [Feature: Int]] = [:]
    
    private let smoothingParameter: Double = 1.0
    
    public init() {}
    
    public func train(features: [Feature], for category: Category) {
        numberOfDocuments += 1
        numberOfDocumentsByCategory[category, default: 0] += 1
        
        for feature in features {
            featureCounts[feature, default: 0] += 1
            featureCountsByCategory[category, default: [:]][feature, default: 0] += 1
        }
    }
    
    public func classify(_ features: [Feature]) -> Category? {
        let categories = numberOfDocumentsByCategory.keys
        guard !categories.isEmpty else {
            return nil
        }
        
        let featureCount = features.count
        var probabilitiesByCategory: [Category: Double] = [:]
        for category in categories {
            let categoryProbability = probability(of: category)
            
            probabilitiesByCategory[category] =
                features.reduce(log(categoryProbability)) { (total, feature) in
                    total + log((probability(of: category, given: feature) + smoothingParameter)
                        / (categoryProbability + smoothingParameter * Double(featureCount)))
            }
        }
        
        return probabilitiesByCategory
            .max(by: { $0.value < $1.value })?
            .key
    }
    
    private func probability(of category: Category) -> Double {
        return Double(numberOfDocumentsByCategory[category] ?? 0) / Double(numberOfDocuments)
    }
    
    private func probability(of category: Category, given feature: Feature) -> Double {
        return Double(featureCountsByCategory[category, default: [:]][feature] ?? 0) / Double(numberOfDocuments)
    }
}

extension NaiveBayesClassifier: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "NaiveBayesClassifier<\(Category.self),\(Feature.self)>"
    }
}
