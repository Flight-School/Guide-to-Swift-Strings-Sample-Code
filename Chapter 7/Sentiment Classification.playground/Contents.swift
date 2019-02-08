import NaturalLanguage

guard let url = Bundle.main.url(forResource: "SentimentClassifier",
                                withExtension: "mlmodelc")
else {
    fatalError("Missing required file")
}

let model = try NLModel(contentsOf: url)

model.predictedLabel(for: "Nice, smooth flight")
model.predictedLabel(for: "Meh, whatever")
model.predictedLabel(for: "Middle seat, lost baggage, missed connecting flight")
