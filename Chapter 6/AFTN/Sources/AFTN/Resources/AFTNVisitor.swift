// Generated from Resources/AFTN.g4 by ANTLR 4.7.1
import Antlr4

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link AFTNParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
open class AFTNVisitor<T>: ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link AFTNParser#message}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitMessage(_ ctx: AFTNParser.MessageContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#heading}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitHeading(_ ctx: AFTNParser.HeadingContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#transmission}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitTransmission(_ ctx: AFTNParser.TransmissionContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#additionalService}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitAdditionalService(_ ctx: AFTNParser.AdditionalServiceContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#destination}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitDestination(_ ctx: AFTNParser.DestinationContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#priority}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitPriority(_ ctx: AFTNParser.PriorityContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#address}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitAddress(_ ctx: AFTNParser.AddressContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#location}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitLocation(_ ctx: AFTNParser.LocationContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#organization}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitOrganization(_ ctx: AFTNParser.OrganizationContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#department}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitDepartment(_ ctx: AFTNParser.DepartmentContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#origin}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitOrigin(_ ctx: AFTNParser.OriginContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#filingTime}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitFilingTime(_ ctx: AFTNParser.FilingTimeContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#day}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitDay(_ ctx: AFTNParser.DayContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#hour}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitHour(_ ctx: AFTNParser.HourContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#minute}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitMinute(_ ctx: AFTNParser.MinuteContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

	/**
	 * Visit a parse tree produced by {@link AFTNParser#text}.
	- Parameters:
	  - ctx: the parse tree
	- returns: the visitor result
	 */
	open func visitText(_ ctx: AFTNParser.TextContext) -> T {
	 	fatalError(#function + " must be overridden")
	}

}