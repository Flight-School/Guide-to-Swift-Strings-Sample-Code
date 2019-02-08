import CreateML
import Foundation

// Airline Twitter sentiment
// https://www.figure-eight.com/data-for-everyone/
guard let url = Bundle.main.url(forResource: "tweets",
                                withExtension: "csv")
    else {
        fatalError("Missing required resource")
}

let trainingData = try MLDataTable(contentsOf: url)
let model = try MLTextClassifier(trainingData: trainingData,
                                 textColumn: "text",
                                 labelColumn: "airline_sentiment")

let path = <#"path/to/SentimentClassifier.mlmodel"#>
try model.write(to: URL(fileURLWithPath: path))
