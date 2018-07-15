//
//  QueryItemEncoderTests.swift
//  QueryItemEncoderTests
//
//  Created by Benedek Kozma on 2018. 07. 15..
//  Copyright © 2018. Benedek Kozma. All rights reserved.
//

import XCTest

class QueryItemEncoderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEncode() {
        let input = SampleObject(string: "test", date: Date(timeIntervalSince1970: 0), number: 1, decimal: Decimal(string: "1.99")!)
        let encoder = QueryItemEncoder()
        encoder.dateEncodingStrategy = .iso8601
        do {
            let output: [URLQueryItem] = try encoder.encode(input)
            XCTAssert(output.count == 4)
            if let string = output.first(where: { $0.name == "string" }) {
                XCTAssertEqual(string.value, "test", "Wrong value encoded for key 'string'")
            } else {
                XCTFail("No item found with key 'string'")
            }
            if let date = output.first(where: { $0.name == "date" }) {
                XCTAssertEqual(date.value, "1970-01-01T00:00:00Z", "Wrong value encoded for key 'date'")
            } else {
                XCTFail("No item found with key 'date'")
            }
            if let number = output.first(where: { $0.name == "number" }) {
                XCTAssertEqual(number.value, "1", "Wrong value encoded for key 'number'")
            } else {
                XCTFail("No item found with key 'number'")
            }
            if let decimal = output.first(where: { $0.name == "decimal" }) {
                XCTAssertEqual(decimal.value, "1.99", "Wrong value encoded for key 'decimal'")
            } else {
                XCTFail("No item found with key 'decimal'")
            }
        } catch let error  {
            XCTFail("QueryItemEncoder.encode threw error: \(error)")
        }
    }
}
