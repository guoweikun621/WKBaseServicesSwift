import XCTest
@testable import WKBaseServicesSwift

class WKBaseServicesSwiftTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(WKBaseServicesSwift().text, "Hello, World!")
    }


    static var allTests : [(String, (WKBaseServicesSwiftTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
