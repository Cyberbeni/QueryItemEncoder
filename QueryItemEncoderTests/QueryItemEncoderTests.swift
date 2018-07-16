//
//  QueryItemEncoderTests.swift
//  QueryItemEncoderTests
//
//  Created by Benedek Kozma on 2018. 07. 15..
//  Copyright © 2018. Benedek Kozma. All rights reserved.
//

import XCTest

class QueryItemEncoderTests: XCTestCase {
    var encoder: QueryItemEncoder!
    var input: SampleObject!
    
    override func setUp() {
        super.setUp()
        self.input = SampleObject(string: "test", date: Date(timeIntervalSince1970: 0), number: 1, decimal: Decimal(string: "1.99")!)
        self.encoder = QueryItemEncoder()
        self.encoder.dateEncodingStrategy = .iso8601
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_encodeOutputCount() {
        do {
            let output: [URLQueryItem] = try encoder.encode(input)
            XCTAssert(output.count == 4)
        } catch let error  {
            XCTFail("QueryItemEncoder.encode threw error: \(error)")
        }
    }
    
    func test_string() {
        do {
            let output = try encoder.encode(self.input)
            if let string = output.first(where: { $0.name == "string" }) {
                XCTAssertEqual(string.value, "test", "Wrong value encoded for key 'string'")
            } else {
                XCTFail("No item found with key 'string'")
            }
        } catch let error {
            XCTFail("QueryItemEncoder.encode threw error: \(error)")
        }
    }
    
    func test_date() {
        do {
            let output = try encoder.encode(self.input)
            if let date = output.first(where: { $0.name == "date" }) {
                XCTAssertEqual(date.value, "1970-01-01T00:00:00Z", "Wrong value encoded for key 'date'")
            } else {
                XCTFail("No item found with key 'date'")
            }
        } catch let error {
            XCTFail("QueryItemEncoder.encode threw error: \(error)")
        }
    }
    
    func test_int() {
        do {
            let output = try encoder.encode(self.input)
            if let number = output.first(where: { $0.name == "number" }) {
                XCTAssertEqual(number.value, "1", "Wrong value encoded for key 'number'")
            } else {
                XCTFail("No item found with key 'number'")
            }
        } catch let error {
            XCTFail("QueryItemEncoder.encode threw error: \(error)")
        }
    }
    
    func test_decimal() {
        do {
            let output = try encoder.encode(self.input)
            if let decimal = output.first(where: { $0.name == "decimal" }) {
                XCTAssertEqual(decimal.value, "1.99", "Wrong value encoded for key 'decimal'")
            } else {
                XCTFail("No item found with key 'decimal'")
            }
        } catch let error {
            XCTFail("QueryItemEncoder.encode threw error: \(error)")
        }
    }
    
    func test_array() {
        let input = [self.input]
        XCTAssertThrowsError(try encoder.encode(input), "QueryItemEncoder.encode didn't throw error for array input") { (error) in
            print(error)
        }
    }
    
    func test_singleValue() {
        let input = "test"
        XCTAssertThrowsError(try encoder.encode(input), "QueryItemEncoder.encode didn't throw error for single value string input") { (error) in
            print(error)
        }
    }
}
