import XCTest

import FeatureTests

var tests = [XCTestCaseEntry]()
tests += FeatureTests.allTests()
XCTMain(tests)
