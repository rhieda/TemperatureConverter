//
//  TemperatureConverterTests.swift
//  TemperatureConverterTests
//
//  Created by Rafael  Hieda on 11/18/19.
//  Copyright © 2019 Rafael Hieda. All rights reserved.
//

import XCTest
@testable import TemperatureConverter

class TemperatureConverterTests: XCTestCase {
    var sut : ContentView!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ContentView()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testContentViewShouldCalculateCorrectlyIfInoutCelsiusOutputFahrenheit() {
        var output = sut.calculate(inputType: .Celsius, outputType: .Fahrenheit)
        XCTAssertEqual(output, 32)
    }
}
