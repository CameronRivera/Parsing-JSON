//
//  ParsingLocalJSONTests.swift
//  ParsingLocalJSONTests
//
//  Created by Cameron Rivera on 8/3/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import XCTest
@testable import ParsingLocalJSON

class ParsingLocalJSONTests: XCTestCase {

    // All unit test function names must be begin with the word test.
    func testModel() {
        // Arrange
        let jsonData = """
[{
        "number": 1,
        "president": "George Washington",
        "birth_year": 1732,
        "death_year": 1799,
        "took_office": "1789-04-30",
        "left_office": "1797-03-04",
        "party": "No Party"
    },
    {
        "number": 2,
        "president": "John Adams",
        "birth_year": 1735,
        "death_year": 1826,
        "took_office": "1797-03-04",
        "left_office": "1801-03-04",
        "party": "Federalist"
    }
]
""".data(using: .utf8)!
        
        let expectedFirstPresident = "George Washington"
        
        // Act
        do {
            let presidents = try JSONDecoder().decode([President].self, from: jsonData)
            
            // Assert
            XCTAssertEqual(expectedFirstPresident, presidents[0].name)
        } catch {
            XCTFail("Decoding Error: \(error.localizedDescription)")
        }
    }
    
    func testParseJSONFromBundle() {
        // Arrange
        let bundle = Bundle.main
        let filename = "Presidents"
        let firstBlackPresident = "Barack Obama"
        
        // Act
        do {
            let presidents = try bundle.parseJSON(with: filename)
            // Assert
            XCTAssertEqual(firstBlackPresident, presidents[43].name)
        } catch {
            XCTFail("DecodingError: \(error.localizedDescription)")
        }
    }

}
