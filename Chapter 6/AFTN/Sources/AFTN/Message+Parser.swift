import Antlr4

extension Message {
    public init?(_ string: String) throws {
        let data = Array(string)
        let input = ANTLRInputStream(data, data.count)
        
        let lexer = AFTNLexer(input)
        let tokens = CommonTokenStream(lexer)
        let parser = try AFTNParser(tokens)
        
        let listener = Listener()
        let walker = ParseTreeWalker()
        try walker.walk(listener, parser.message())
        
        guard let message = listener.message else {
            return nil
        }
        
        self = message
    }
    
    final class Listener: AFTNBaseListener {
        var transmission: String?
        var additionalService: String?
        var priorityIndicator: String?
        var destinationLocation: String?
        var destinationOrganization: String?
        var destinationDepartmentIndicator: String?
        var filingDay: Int?
        var filingHour: Int?
        var filingMinute: Int?
        var originLocation: String?
        var originOrganization: String?
        var originDepartmentIndicator: String?
        var text: String?

        var message: Message?
        
        override func enterTransmission(_ ctx: AFTNParser.TransmissionContext) {
            self.transmission = ctx.getText()
        }
        
        override func enterAdditionalService(_ ctx: AFTNParser.AdditionalServiceContext) {
            self.additionalService = ctx.getText()
        }
        
        override func enterPriority(_ ctx: AFTNParser.PriorityContext) {
            self.priorityIndicator = ctx.getText()
        }
        
        override func enterLocation(_ ctx: AFTNParser.LocationContext) {
            switch ctx.parent?.parent {
            case is AFTNParser.OriginContext:
                self.originLocation = ctx.getText()
            case is AFTNParser.DestinationContext:
                self.destinationLocation = ctx.getText()
            default:
                return
            }
        }
 
        override func enterOrganization(_ ctx: AFTNParser.OrganizationContext) {
            switch ctx.parent?.parent {
            case is AFTNParser.OriginContext:
                self.originOrganization = ctx.getText()
            case is AFTNParser.DestinationContext:
                self.destinationOrganization = ctx.getText()
            default:
                return
            }
        }
        
        override func enterDepartment(_ ctx: AFTNParser.DepartmentContext) {
            switch ctx.parent?.parent {
            case is AFTNParser.OriginContext:
                self.originDepartmentIndicator = ctx.getText()
            case is AFTNParser.DestinationContext:
                self.destinationDepartmentIndicator = ctx.getText()
            default:
                return
            }
        }
        
        override func enterDay(_ ctx: AFTNParser.DayContext) {
            self.filingDay = Int(ctx.getText())
        }
        
        override func enterHour(_ ctx: AFTNParser.HourContext) {
            self.filingHour = Int(ctx.getText())
        }
        
        override func enterMinute(_ ctx: AFTNParser.MinuteContext) {
            self.filingMinute = Int(ctx.getText())
        }
        
        override func enterText(_ ctx: AFTNParser.TextContext) {
            self.text = ctx.getText()
        }

        override func exitMessage(_ ctx: AFTNParser.MessageContext) {
            guard let transmission = self.transmission,
                let priorityIndicator = self.priorityIndicator,
                let priority = Message.Priority(rawValue: priorityIndicator),
                let destinationLocation = self.destinationLocation,
                let destinationOrganization = self.destinationOrganization,
                let destinationDepartmentIndicator = self.destinationDepartmentIndicator,
                let destinationDepartment = Message.Address.Department(rawValue: destinationDepartmentIndicator),
                let filingDay = self.filingDay,
                let filingHour = self.filingHour,
                let filingMinute = self.filingMinute,
                let originLocation = self.originLocation,
                let originOrganization = self.originOrganization,
                let originDepartmentIndicator = self.originDepartmentIndicator,
                let originDepartment = Message.Address.Department(rawValue: originDepartmentIndicator),
                let text = self.text
            else {
                return
            }
            
            let destination = Message.Address(location: destinationLocation,
                                              organization: destinationOrganization,
                                              department: destinationDepartment)
            
            let origin = Message.Address(location: originLocation,
                                         organization: originOrganization,
                                         department: originDepartment)
            
            self.message = Message(transmission: transmission,
                                   additionalService: additionalService,
                                   priority: priority,
                                   destination: destination,
                                   filingTime: (filingDay, filingHour, filingMinute),
                                   origin: origin,
                                   text: text)
        }
    }
}
