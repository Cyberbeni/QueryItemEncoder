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
        let input = SampleObject(string: "test", date: Date(), number: 1)
        let encoder = QueryItemEncoder()
        do {
            let output: [URLQueryItem] = try encoder.encode(input)
            print(output)
            XCTAssert(output.count == 3)
        } catch {
            XCTFail()
        }
    }
}
