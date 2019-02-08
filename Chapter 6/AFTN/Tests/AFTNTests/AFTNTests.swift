import XCTest
import AFTN

final class AFTNTests: XCTestCase {
    func testMessageParse() throws {
        let transmission = "NRA062"
        let additionalService = "270930"
        
        let priority = "GG"
        
        let destinationLocation = "KHIO"
        let destinationOrganization = "YYY"
        let destinationDepartment = "X"
        let destination = "\(destinationLocation)\(destinationOrganization)\(destinationDepartment)"
        
        let filingDay = 31
        let filingHour = 15
        let filingMinute = 21
        let filingTime = "\(filingDay)\(filingHour)\(filingMinute)"
        
        let originLocation = "KTTD"
        let originOrganization = "ZTZ"
        let originDepartment = "X"
        let origin = "\(originLocation)\(originOrganization)\(originDepartment)"
        
        let text = "AIR SWIFT FLIGHT 42\nCANCELLED"
        
        let string = """
        ZCZC \(transmission) \(additionalService)
        \(priority) \(destination)
        \(filingTime) \(origin)
        \(text)
        NNNN
        """
        
        guard let message = try Message(string) else {
            XCTFail("Failed to parse message")
            return
        }
        
        XCTAssertEqual(message.transmission, transmission)
        XCTAssertEqual(message.additionalService, additionalService)
        XCTAssertEqual(message.priority.rawValue, priority)
        XCTAssertEqual(message.destination.location, destinationLocation)
        XCTAssertEqual(message.destination.organization, destinationOrganization)
        XCTAssertEqual(message.destination.department.rawValue, destinationDepartment)
        XCTAssertEqual(message.filingTime.day, filingDay)
        XCTAssertEqual(message.filingTime.hour, filingHour)
        XCTAssertEqual(message.filingTime.minute, filingMinute)
        XCTAssertEqual(message.origin.location, originLocation)
        XCTAssertEqual(message.origin.organization, originOrganization)
        XCTAssertEqual(message.origin.department.rawValue, originDepartment)
        XCTAssertEqual(message.text, text)
    }

    static var allTests = [
        ("testMessageParse", testMessageParse),
    ]
}
