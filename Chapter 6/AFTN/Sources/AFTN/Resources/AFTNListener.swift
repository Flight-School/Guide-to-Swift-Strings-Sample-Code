// Generated from Resources/AFTN.g4 by ANTLR 4.7.1
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link AFTNParser}.
 */
public protocol AFTNListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link AFTNParser#message}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMessage(_ ctx: AFTNParser.MessageContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#message}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMessage(_ ctx: AFTNParser.MessageContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#heading}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterHeading(_ ctx: AFTNParser.HeadingContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#heading}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitHeading(_ ctx: AFTNParser.HeadingContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#transmission}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTransmission(_ ctx: AFTNParser.TransmissionContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#transmission}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTransmission(_ ctx: AFTNParser.TransmissionContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#additionalService}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAdditionalService(_ ctx: AFTNParser.AdditionalServiceContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#additionalService}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAdditionalService(_ ctx: AFTNParser.AdditionalServiceContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#destination}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDestination(_ ctx: AFTNParser.DestinationContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#destination}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDestination(_ ctx: AFTNParser.DestinationContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#priority}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPriority(_ ctx: AFTNParser.PriorityContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#priority}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPriority(_ ctx: AFTNParser.PriorityContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#address}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAddress(_ ctx: AFTNParser.AddressContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#address}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAddress(_ ctx: AFTNParser.AddressContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#location}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLocation(_ ctx: AFTNParser.LocationContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#location}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLocation(_ ctx: AFTNParser.LocationContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#organization}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterOrganization(_ ctx: AFTNParser.OrganizationContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#organization}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitOrganization(_ ctx: AFTNParser.OrganizationContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#department}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDepartment(_ ctx: AFTNParser.DepartmentContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#department}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDepartment(_ ctx: AFTNParser.DepartmentContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#origin}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterOrigin(_ ctx: AFTNParser.OriginContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#origin}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitOrigin(_ ctx: AFTNParser.OriginContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#filingTime}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFilingTime(_ ctx: AFTNParser.FilingTimeContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#filingTime}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFilingTime(_ ctx: AFTNParser.FilingTimeContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#day}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDay(_ ctx: AFTNParser.DayContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#day}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDay(_ ctx: AFTNParser.DayContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#hour}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterHour(_ ctx: AFTNParser.HourContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#hour}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitHour(_ ctx: AFTNParser.HourContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#minute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMinute(_ ctx: AFTNParser.MinuteContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#minute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMinute(_ ctx: AFTNParser.MinuteContext)
	/**
	 * Enter a parse tree produced by {@link AFTNParser#text}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterText(_ ctx: AFTNParser.TextContext)
	/**
	 * Exit a parse tree produced by {@link AFTNParser#text}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitText(_ ctx: AFTNParser.TextContext)
}