// Generated from Resources/AFTN.g4 by ANTLR 4.7.1
import Antlr4

open class AFTNLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = AFTNLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(AFTNLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let LETTER=1, DIGIT=2, PUNCTUATION=3, CRLF=4, SP=5, SOM=6, EOM=7

	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE"
	]

	public
	static let ruleNames: [String] = [
		"LETTER", "DIGIT", "PUNCTUATION", "CRLF", "SP", "SOM", "EOM"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, nil, nil, nil, "' '", "'ZCZC'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "LETTER", "DIGIT", "PUNCTUATION", "CRLF", "SP", "SOM", "EOM"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)


	override open
	func getVocabulary() -> Vocabulary {
		return AFTNLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, AFTNLexer._ATN, AFTNLexer._decisionToDFA, AFTNLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "AFTN.g4" }

	override open
	func getRuleNames() -> [String] { return AFTNLexer.ruleNames }

	override open
	func getSerializedATN() -> String { return AFTNLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return AFTNLexer.channelNames }

	override open
	func getModeNames() -> [String] { return AFTNLexer.modeNames }

	override open
	func getATN() -> ATN { return AFTNLexer._ATN }


	public
	static let _serializedATN: String = AFTNLexerATN().jsonString

	public
	static let _ATN: ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}