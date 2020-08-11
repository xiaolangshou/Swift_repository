//
//  UnitTestDemoTests.swift
//  UnitTestDemoTests
//
//  Created by Thomas Lau on 2020/8/9.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import XCTest
@testable import UnitTestDemo

class UnitTestDemoTests: XCTestCase {

    func testHelloworld() {
        var helloworld: String?
        
        XCTAssertNil(helloworld)
        
        helloworld = "hello world"
        
        XCTAssertEqual(helloworld, "hello world")
    }

    func testSquareInt() {
        let value = 3
        let squareValue = value.square()
        
        XCTAssertEqual(squareValue, 27)
    }
}
