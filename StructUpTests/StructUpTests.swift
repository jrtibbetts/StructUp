//
//  StructUpTests.swift
//  StructUpTests
//
//  Created by Tibbetts, Jason on 5/20/19.
//  Copyright © 2019 Poikile Creations. All rights reserved.
//

import XCTest
@testable import StructUp

class StructUpTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        StructManager.destruction = Destruction2()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
