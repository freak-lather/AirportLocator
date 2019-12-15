//
//  AirportRepositoryTest.swift
//  AirportLocatorTests
//
//  Created by ven2aj on 15/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import XCTest
@testable import AirportLocator

class AirportRepositoryTest: XCTestCase {

    var repository: AirportRepository!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repository = AirportRepository()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        repository = nil
    }
    
    func testGetAllRecords() {
        let expectationGetAllAirports: XCTestExpectation = expectation(description: "Expected to fetch all airports from data.json with success response message")
        self.repository.getAllAirports { (airport, message) in
            XCTAssertNotNil(airport)
            XCTAssertEqual(message, ResponseMessage.getSuccess.rawValue)
            expectationGetAllAirports.fulfill()
        }
        waitForExpectations(timeout: 4.0) { (error) in
            if let _ = error{
                XCTFail("Failed to get all airports from json")
            }
        }
    }
}

