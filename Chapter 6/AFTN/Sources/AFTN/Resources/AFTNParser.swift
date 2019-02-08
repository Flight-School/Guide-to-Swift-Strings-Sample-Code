// Generated from Resources/AFTN.g4 by ANTLR 4.7.1
import Antlr4

open class AFTNParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = AFTNParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(AFTNParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, LETTER = 1, DIGIT = 2, PUNCTUATION = 3, CRLF = 4, SP = 5, 
                 SOM = 6, EOM = 7
	}

	public
	static let RULE_message = 0, RULE_heading = 1, RULE_transmission = 2, RULE_additionalService = 3, 
            RULE_destination = 4, RULE_priority = 5, RULE_address = 6, RULE_location = 7, 
            RULE_organization = 8, RULE_department = 9, RULE_origin = 10, 
            RULE_filingTime = 11, RULE_day = 12, RULE_hour = 13, RULE_minute = 14, 
            RULE_text = 15

	public
	static let ruleNames: [String] = [
		"message", "heading", "transmission", "additionalService", "destination", 
		"priority", "address", "location", "organization", "department", "origin", 
		"filingTime", "day", "hour", "minute", "text"
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
	func getGrammarFileName() -> String { return "AFTN.g4" }

	override open
	func getRuleNames() -> [String] { return AFTNParser.ruleNames }

	override open
	func getSerializedATN() -> String { return AFTNParser._serializedATN }

	override open
	func getATN() -> ATN { return AFTNParser._ATN }

	override open
	func getVocabulary() -> Vocabulary {
	    return AFTNParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,AFTNParser._ATN,AFTNParser._decisionToDFA, AFTNParser._sharedContextCache)
	}

	public class MessageContext: ParserRuleContext {
			open
			func SOM() -> TerminalNode? {
				return getToken(AFTNParser.Tokens.SOM.rawValue, 0)
			}
			open
			func heading() -> HeadingContext? {
				return getRuleContext(HeadingContext.self, 0)
			}
			open
			func CRLF() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.CRLF.rawValue)
			}
			open
			func CRLF(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.CRLF.rawValue, i)
			}
			open
			func destination() -> DestinationContext? {
				return getRuleContext(DestinationContext.self, 0)
			}
			open
			func origin() -> OriginContext? {
				return getRuleContext(OriginContext.self, 0)
			}
			open
			func text() -> TextContext? {
				return getRuleContext(TextContext.self, 0)
			}
			open
			func EOM() -> TerminalNode? {
				return getToken(AFTNParser.Tokens.EOM.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_message
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterMessage(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitMessage(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitMessage(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitMessage(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func message() throws -> MessageContext {
		var _localctx: MessageContext = MessageContext(_ctx, getState())
		try enterRule(_localctx, 0, AFTNParser.RULE_message)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(32)
		 	try match(AFTNParser.Tokens.SOM.rawValue)
		 	setState(33)
		 	try heading()
		 	setState(34)
		 	try match(AFTNParser.Tokens.CRLF.rawValue)
		 	setState(35)
		 	try destination()
		 	setState(36)
		 	try match(AFTNParser.Tokens.CRLF.rawValue)
		 	setState(37)
		 	try origin()
		 	setState(41)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,0,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(38)
		 			try match(AFTNParser.Tokens.CRLF.rawValue)

		 	 
		 		}
		 		setState(43)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,0,_ctx)
		 	}
		 	setState(44)
		 	try text()
		 	setState(46) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(45)
		 		try match(AFTNParser.Tokens.CRLF.rawValue)


		 		setState(48); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == AFTNParser.Tokens.CRLF.rawValue
		 	      return testSet
		 	 }())
		 	setState(50)
		 	try match(AFTNParser.Tokens.EOM.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class HeadingContext: ParserRuleContext {
			open
			func SP() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.SP.rawValue)
			}
			open
			func SP(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.SP.rawValue, i)
			}
			open
			func transmission() -> TransmissionContext? {
				return getRuleContext(TransmissionContext.self, 0)
			}
			open
			func additionalService() -> AdditionalServiceContext? {
				return getRuleContext(AdditionalServiceContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_heading
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterHeading(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitHeading(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitHeading(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitHeading(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func heading() throws -> HeadingContext {
		var _localctx: HeadingContext = HeadingContext(_ctx, getState())
		try enterRule(_localctx, 2, AFTNParser.RULE_heading)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(52)
		 	try match(AFTNParser.Tokens.SP.rawValue)
		 	setState(53)
		 	try transmission()
		 	setState(56)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == AFTNParser.Tokens.SP.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(54)
		 		try match(AFTNParser.Tokens.SP.rawValue)
		 		setState(55)
		 		try additionalService()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TransmissionContext: ParserRuleContext {
			open
			func LETTER() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.LETTER.rawValue)
			}
			open
			func LETTER(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.LETTER.rawValue, i)
			}
			open
			func DIGIT() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.DIGIT.rawValue)
			}
			open
			func DIGIT(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.DIGIT.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_transmission
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterTransmission(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitTransmission(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitTransmission(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitTransmission(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func transmission() throws -> TransmissionContext {
		var _localctx: TransmissionContext = TransmissionContext(_ctx, getState())
		try enterRule(_localctx, 4, AFTNParser.RULE_transmission)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(58)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)
		 	setState(59)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)
		 	setState(60)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)
		 	setState(61)
		 	try match(AFTNParser.Tokens.DIGIT.rawValue)
		 	setState(62)
		 	try match(AFTNParser.Tokens.DIGIT.rawValue)
		 	setState(63)
		 	try match(AFTNParser.Tokens.DIGIT.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AdditionalServiceContext: ParserRuleContext {
			open
			func DIGIT() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.DIGIT.rawValue)
			}
			open
			func DIGIT(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.DIGIT.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_additionalService
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterAdditionalService(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitAdditionalService(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitAdditionalService(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitAdditionalService(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func additionalService() throws -> AdditionalServiceContext {
		var _localctx: AdditionalServiceContext = AdditionalServiceContext(_ctx, getState())
		try enterRule(_localctx, 6, AFTNParser.RULE_additionalService)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(66) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(65)
		 		try match(AFTNParser.Tokens.DIGIT.rawValue)


		 		setState(68); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == AFTNParser.Tokens.DIGIT.rawValue
		 	      return testSet
		 	 }())

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DestinationContext: ParserRuleContext {
			open
			func priority() -> PriorityContext? {
				return getRuleContext(PriorityContext.self, 0)
			}
			open
			func SP() -> TerminalNode? {
				return getToken(AFTNParser.Tokens.SP.rawValue, 0)
			}
			open
			func address() -> AddressContext? {
				return getRuleContext(AddressContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_destination
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterDestination(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitDestination(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitDestination(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitDestination(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func destination() throws -> DestinationContext {
		var _localctx: DestinationContext = DestinationContext(_ctx, getState())
		try enterRule(_localctx, 8, AFTNParser.RULE_destination)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(70)
		 	try priority()
		 	setState(71)
		 	try match(AFTNParser.Tokens.SP.rawValue)
		 	setState(72)
		 	try address()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PriorityContext: ParserRuleContext {
			open
			func LETTER() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.LETTER.rawValue)
			}
			open
			func LETTER(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.LETTER.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_priority
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterPriority(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitPriority(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitPriority(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitPriority(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func priority() throws -> PriorityContext {
		var _localctx: PriorityContext = PriorityContext(_ctx, getState())
		try enterRule(_localctx, 10, AFTNParser.RULE_priority)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(74)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)
		 	setState(75)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AddressContext: ParserRuleContext {
			open
			func location() -> LocationContext? {
				return getRuleContext(LocationContext.self, 0)
			}
			open
			func organization() -> OrganizationContext? {
				return getRuleContext(OrganizationContext.self, 0)
			}
			open
			func department() -> DepartmentContext? {
				return getRuleContext(DepartmentContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_address
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterAddress(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitAddress(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitAddress(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitAddress(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func address() throws -> AddressContext {
		var _localctx: AddressContext = AddressContext(_ctx, getState())
		try enterRule(_localctx, 12, AFTNParser.RULE_address)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(77)
		 	try location()
		 	setState(78)
		 	try organization()
		 	setState(79)
		 	try department()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LocationContext: ParserRuleContext {
			open
			func LETTER() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.LETTER.rawValue)
			}
			open
			func LETTER(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.LETTER.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_location
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterLocation(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitLocation(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitLocation(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitLocation(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func location() throws -> LocationContext {
		var _localctx: LocationContext = LocationContext(_ctx, getState())
		try enterRule(_localctx, 14, AFTNParser.RULE_location)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(81)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)
		 	setState(82)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)
		 	setState(83)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)
		 	setState(84)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class OrganizationContext: ParserRuleContext {
			open
			func LETTER() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.LETTER.rawValue)
			}
			open
			func LETTER(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.LETTER.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_organization
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterOrganization(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitOrganization(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitOrganization(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitOrganization(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func organization() throws -> OrganizationContext {
		var _localctx: OrganizationContext = OrganizationContext(_ctx, getState())
		try enterRule(_localctx, 16, AFTNParser.RULE_organization)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(86)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)
		 	setState(87)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)
		 	setState(88)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DepartmentContext: ParserRuleContext {
			open
			func LETTER() -> TerminalNode? {
				return getToken(AFTNParser.Tokens.LETTER.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_department
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterDepartment(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitDepartment(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitDepartment(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitDepartment(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func department() throws -> DepartmentContext {
		var _localctx: DepartmentContext = DepartmentContext(_ctx, getState())
		try enterRule(_localctx, 18, AFTNParser.RULE_department)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(90)
		 	try match(AFTNParser.Tokens.LETTER.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class OriginContext: ParserRuleContext {
			open
			func filingTime() -> FilingTimeContext? {
				return getRuleContext(FilingTimeContext.self, 0)
			}
			open
			func SP() -> TerminalNode? {
				return getToken(AFTNParser.Tokens.SP.rawValue, 0)
			}
			open
			func address() -> AddressContext? {
				return getRuleContext(AddressContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_origin
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterOrigin(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitOrigin(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitOrigin(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitOrigin(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func origin() throws -> OriginContext {
		var _localctx: OriginContext = OriginContext(_ctx, getState())
		try enterRule(_localctx, 20, AFTNParser.RULE_origin)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(92)
		 	try filingTime()
		 	setState(93)
		 	try match(AFTNParser.Tokens.SP.rawValue)
		 	setState(94)
		 	try address()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FilingTimeContext: ParserRuleContext {
			open
			func day() -> DayContext? {
				return getRuleContext(DayContext.self, 0)
			}
			open
			func hour() -> HourContext? {
				return getRuleContext(HourContext.self, 0)
			}
			open
			func minute() -> MinuteContext? {
				return getRuleContext(MinuteContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_filingTime
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterFilingTime(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitFilingTime(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitFilingTime(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitFilingTime(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func filingTime() throws -> FilingTimeContext {
		var _localctx: FilingTimeContext = FilingTimeContext(_ctx, getState())
		try enterRule(_localctx, 22, AFTNParser.RULE_filingTime)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(96)
		 	try day()
		 	setState(97)
		 	try hour()
		 	setState(98)
		 	try minute()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DayContext: ParserRuleContext {
			open
			func DIGIT() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.DIGIT.rawValue)
			}
			open
			func DIGIT(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.DIGIT.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_day
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterDay(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitDay(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitDay(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitDay(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func day() throws -> DayContext {
		var _localctx: DayContext = DayContext(_ctx, getState())
		try enterRule(_localctx, 24, AFTNParser.RULE_day)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(100)
		 	try match(AFTNParser.Tokens.DIGIT.rawValue)
		 	setState(101)
		 	try match(AFTNParser.Tokens.DIGIT.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class HourContext: ParserRuleContext {
			open
			func DIGIT() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.DIGIT.rawValue)
			}
			open
			func DIGIT(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.DIGIT.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_hour
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterHour(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitHour(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitHour(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitHour(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func hour() throws -> HourContext {
		var _localctx: HourContext = HourContext(_ctx, getState())
		try enterRule(_localctx, 26, AFTNParser.RULE_hour)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(103)
		 	try match(AFTNParser.Tokens.DIGIT.rawValue)
		 	setState(104)
		 	try match(AFTNParser.Tokens.DIGIT.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MinuteContext: ParserRuleContext {
			open
			func DIGIT() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.DIGIT.rawValue)
			}
			open
			func DIGIT(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.DIGIT.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_minute
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterMinute(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitMinute(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitMinute(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitMinute(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func minute() throws -> MinuteContext {
		var _localctx: MinuteContext = MinuteContext(_ctx, getState())
		try enterRule(_localctx, 28, AFTNParser.RULE_minute)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(106)
		 	try match(AFTNParser.Tokens.DIGIT.rawValue)
		 	setState(107)
		 	try match(AFTNParser.Tokens.DIGIT.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TextContext: ParserRuleContext {
			open
			func CRLF() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.CRLF.rawValue)
			}
			open
			func CRLF(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.CRLF.rawValue, i)
			}
			open
			func LETTER() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.LETTER.rawValue)
			}
			open
			func LETTER(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.LETTER.rawValue, i)
			}
			open
			func DIGIT() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.DIGIT.rawValue)
			}
			open
			func DIGIT(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.DIGIT.rawValue, i)
			}
			open
			func PUNCTUATION() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.PUNCTUATION.rawValue)
			}
			open
			func PUNCTUATION(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.PUNCTUATION.rawValue, i)
			}
			open
			func SP() -> [TerminalNode] {
				return getTokens(AFTNParser.Tokens.SP.rawValue)
			}
			open
			func SP(_ i:Int) -> TerminalNode? {
				return getToken(AFTNParser.Tokens.SP.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return AFTNParser.RULE_text
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.enterText(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? AFTNListener {
				listener.exitText(self)
			}
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? AFTNVisitor {
			    return visitor.visitText(self)
			}
			else if let visitor = visitor as? AFTNBaseVisitor {
			    return visitor.visitText(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func text() throws -> TextContext {
		var _localctx: TextContext = TextContext(_ctx, getState())
		try enterRule(_localctx, 30, AFTNParser.RULE_text)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(117); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(110)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (//closure
		 			 { () -> Bool in
		 			      let testSet: Bool = _la == AFTNParser.Tokens.CRLF.rawValue
		 			      return testSet
		 			 }()) {
		 				setState(109)
		 				try match(AFTNParser.Tokens.CRLF.rawValue)

		 			}

		 			setState(113); 
		 			try _errHandler.sync(self)
		 			_alt = 1;
		 			repeat {
		 				switch (_alt) {
		 				case 1:
		 					setState(112)
		 					_la = try _input.LA(1)
		 					if (!(//closure
		 					 { () -> Bool in
		 					      let testSet: Bool = {  () -> Bool in
		 					   let testArray: [Int] = [_la, AFTNParser.Tokens.LETTER.rawValue,AFTNParser.Tokens.DIGIT.rawValue,AFTNParser.Tokens.PUNCTUATION.rawValue,AFTNParser.Tokens.SP.rawValue]
		 					    return  Utils.testBitLeftShiftArray(testArray, 0)
		 					}()
		 					      return testSet
		 					 }())) {
		 					try _errHandler.recoverInline(self)
		 					}
		 					else {
		 						_errHandler.reportMatch(self)
		 						try consume()
		 					}


		 					break
		 				default:
		 					throw ANTLRException.recognition(e: NoViableAltException(self))
		 				}
		 				setState(115); 
		 				try _errHandler.sync(self)
		 				_alt = try getInterpreter().adaptivePredict(_input,5,_ctx)
		 			} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)


		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(119); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
		 	} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public
	static let _serializedATN = AFTNParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}