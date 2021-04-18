import XCTest
@testable import Feature

final class FeatureTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Feature().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
