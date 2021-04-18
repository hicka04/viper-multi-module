import XCTest

import LogicTests

var tests = [XCTestCaseEntry]()
tests += LogicTests.allTests()
XCTMain(tests)
