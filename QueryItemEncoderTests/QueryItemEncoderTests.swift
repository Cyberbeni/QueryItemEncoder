//
//  QueryItemEncoderTests.swift
//  QueryItemEncoderTests
//
//  Created by Benedek Kozma on 2018. 07. 15..
//  Copyright © 2018. Benedek Kozma. All rights reserved.
//

import XCTest
@testable import QueryItemEncoder

class QueryItemEncoderTests: XCTestCase {
    var encoder: QueryItemEncoder!
    var input: SampleObject!
    
    override func setUp() {
        super.setUp()
        self.input = SampleObject(string: "test", date: Date(timeIntervalSince1970: 0), number: 1, decimal: Decimal(string: "1.999")!)
        self.encoder = QueryItemEncoder()
        self.encoder.dateEncodingStrategy = .iso8601
        self.encoder.floatEncodingStrategy = .fixedPoint(2)
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
                XCTAssertEqual(decimal.value, "1.999", "Wrong value encoded for key 'decimal'")
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
    
    func test_cgFloat() {
        let input: CGFloat = 2.001
        let inputDict = ["cgfloat": input]
        do {
            let output = try encoder.encode(inputDict)
            if let cgfloat = output.first(where: { $0.name == "cgfloat" }) {
                XCTAssertEqual(cgfloat.value, "2", "Wrong value encoded for key 'cgfloat'")
            } else {
                XCTFail("No item found with key 'cgfloat'")
            }
        } catch let error {
            XCTFail("QueryItemEncoder.encode threw error: \(error)")
        }
    }
    
    func test_double() {
        let input: Double = 2.6
        let inputDict = ["double": input]
        do {
            let output = try encoder.encode(inputDict)
            if let double = output.first(where: { $0.name == "double" }) {
                XCTAssertEqual(double.value, "2.6", "Wrong value encoded for key 'double'")
            } else {
                XCTFail("No item found with key 'double'")
            }
        } catch let error {
            XCTFail("QueryItemEncoder.encode threw error: \(error)")
        }
    }
    
    func test_float() {
        self.encoder.floatEncodingStrategy = .exactFixedPoint(2)
        let input: Float = 2.6
        let inputDict = ["float": input]
        do {
            let output = try encoder.encode(inputDict)
            if let float = output.first(where: { $0.name == "float" }) {
                XCTAssertEqual(float.value, "2.60", "Wrong value encoded for key 'float'")
            } else {
                XCTFail("No item found with key 'float'")
            }
        } catch let error {
            XCTFail("QueryItemEncoder.encode threw error: \(error)")
        }
    }
}
