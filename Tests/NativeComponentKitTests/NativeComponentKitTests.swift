import XCTest
@testable import NativeComponentKit

final class NativeComponentKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NativeComponentKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
