//
//  LimitedTests.swift
//  RefereeTests
//
//  Created by Ilya Cherkasov on 27.07.2022.
//

import XCTest
@testable import Referee

class LimitedTests: XCTestCase {
    
    @Limited(from: 0, to: 100, value: 50) var testValue: Int
    
    override func setUpWithError() throws {
        //начало теста
    }
    
    override func tearDownWithError() throws {
        // конец теста
    }
    
    func testCorrectValue() throws {
        //Given
        let rightValue = 50
        //When
        testValue = 50
        //Then
        XCTAssertEqual(testValue, rightValue)
    }
    
    func testEqualMinValue() {
        let rightValue = 0
        testValue = 0
        XCTAssertEqual(testValue, rightValue)
    }
    
    func testLessThenMinValue() {
        let rightValue = 0
        testValue = -50
        XCTAssertEqual(testValue, rightValue)
    }
    
    func testMaxEqualValue() {
        let rightValue = 100
        testValue = 100
        XCTAssertEqual(testValue, rightValue)
    }
    
    func testGreatThenMaxValue() {
        let rightValue = 100
        testValue = 200
        XCTAssertEqual(testValue, rightValue)
    }
    
}
