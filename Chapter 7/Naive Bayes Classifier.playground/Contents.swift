enum Sentiment: String, Hashable {
    case positive, negative
}

let classifier = NaiveBayesClassifier<Sentiment, String>()
classifier.trainText("great flight", for: .positive)
classifier.trainText("flight was late and turbulent", for: .negative)

classifier.classifyText("I had a great flight")
classifier.classifyText("flight was really late")
