import XCTest
@testable import FarmhouseCore

final class FarmhouseCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FarmhouseCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
